# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require './lib/user'
require './lib/home'

class McAirBnB < Sinatra::Base
  enable :sessions

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

  get '/home' do
    @user_name = session[:user_name]
    p params
    Home.connect('mcairbnb')
    @homes = Home.list_homes
    erb(:home)
  end

  run! if app_file == $PROGRAM_NAME
end
