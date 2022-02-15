require 'sinatra'
require 'sinatra/reloader'
require './lib/user'

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
    @homes = ["Lovely Home", "It's a house", "9.99 per night"]
    erb(:home)
  end

  run! if app_file == $0
end


