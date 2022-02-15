require 'sinatra'
require 'sinatra/reloader'
require './lib/user'

class Mcairbnb < Sinatra::Base

  get '/index' do
    erb(:index)
  end

  get '/signupform' do
    erb(:signupform)
  end

  post '/signup' do
    @user_name = params[:user_name]
    @password = params[:password]
    User.signup(@user_name, @password)
    redirect '/index'
  end

  get '/login' do
    erb(:login)
  end

  run! if app_file == $0
end


