require 'sinatra'
require 'sinatra/reloader'
require './lib/user'
require './lib/home'
require './lib/bookings'

class Mcairbnb < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/signupform' do
    erb(:signupform)
  end

  post '/signup' do
    @user_name = params[:user_name]
    @password = params[:password]
    User.signup(@user_name, @password)
    redirect '/home'
  end

  get '/login' do
    erb(:login)
  end

  get '/home' do
    Home.connect('mcairbnb')
    @homes = Home.list_homes
    erb(:home)
  end

  get '/bookingsform' do
    # @start_date = params[:start_date]
    # @end_date = params[:end_date]
    # Bookings.connect('mcairbnb')
    @bookings = Bookings.list_bookings
    p @bookings
    erb(:bookingsform)
  end

  post '/booked' do
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    
    erb(:confirmation)
  end



  run! if app_file == $0
end


