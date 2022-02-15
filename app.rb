require 'sinatra'
require 'sinatra/reloader'
require './lib/user'
require './lib/home'

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
    Home.connect('mcairbnb')
    @homes = Home.list_homes
    erb(:home)
  end

  run! if app_file == $0
end


