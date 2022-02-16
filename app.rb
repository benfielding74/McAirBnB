# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require './lib/user'
require './lib/home'

class McAirBnB < Sinatra::Base
  enable :sessions

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
    session[:user_name] = @user_name
    User.signup(@user_name, @password)
    redirect '/home'
  end

  get '/login' do
    erb(:login)
  end

  post '/authenticate' do
    @user_name = params[:user_name]
    @password = params[:password]
    user = User.login(@user_name, @password)
    if user
    redirect '/home'
    else
      @flash = 'Please check your email or password'
      redirect '/login'
    end
  end

  get '/home' do
    @user_name = session[:user_name]
    p params
    Home.connect('mcairbnb')
    @homes = Home.list_homes
    erb(:home)
  end

  get '/home/' do
    redirect '/home'
  end

  get '/home/*' do
    connection = PG.connect(dbname: 'mcairbnb')
    name = params['splat'].first
    description = connection.exec("SELECT description from homes where name='#{name}';")
    @description = unwrap(description)

    price = connection.exec("SELECT price from homes where name='#{name}';")
    @price = unwrap(price)

    ["<p> NAME: #{name}", "<p> DESCRIPTION: #{@description}", "<p> PRICE: #{@price}"]
  end

  run! if app_file == $PROGRAM_NAME
end
