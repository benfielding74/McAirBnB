# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require './lib/user'
require './lib/home'
require './lib/bookings'

class McAirBnB < Sinatra::Base
  enable :sessions

  def select_database
    'mcairbnb_test' if ENV['ENVIRONMENT'] == 'test'
    'mcairbnb'
  end

  def unwrap(result_object)
    result_object.values[0][0]
  end

  get '/' do
    erb(:index)
  end

  get '/signupform' do
    erb(:signupform)
  end

  post '/signup' do
    @user_name = params[:user_name]
    @password = params[:password]
    User.connect(select_database)
    User.signup(@user_name, @password)
    session[:user_name] = @user_name
    redirect '/home'
  end

  get '/login' do
    @flash = session[:flash] || ''
    erb(:login)
  end

  post '/authenticate' do
    @user_name = params[:user_name]
    @password = params[:password]
    session[:user_name] = @user_name
    User.connect(select_database)
    user = User.login(@user_name, @password)

    if user
      redirect '/home'
    else
      session[:flash] = 'Please check your email or password'
      redirect '/login'
    end
  end

  get '/home' do
    @user_name = session[:user_name]
    Home.connect(select_database)
    @homes = Home.list_homes
    erb(:home)
  end

  get '/home/' do
    redirect '/home'
  end

  get '/home/*' do
    connection = PG.connect(dbname: select_database)
    name = params['splat'].first

    description = connection.exec("SELECT description from homes where name='#{name}';")
    @description = unwrap(description)

    price = connection.exec("SELECT price from homes where name='#{name}';")
    @price = unwrap(price)

    ["<p> NAME: #{name}", "<p> DESCRIPTION: #{@description}", "<p> PRICE: #{@price}"]
  end

  get '/bookingsform' do
    @bookings = Bookings.list_bookings
    erb(:bookingsform)
  end

  post '/booked' do
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    erb(:confirmation)
  end

  run! if app_file == $PROGRAM_NAME
end
