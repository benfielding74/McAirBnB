require 'sinatra'
require 'sinatra/reloader'

class Mcairbnb < Sinatra::Base

  get '/index' do
    @user_name = params[:user_name]
    @email = params[:email]
    erb(:index)
  end

  get '/signupform' do
    erb(:signupform)
  end

  get '/login' do
    erb(:login)
  end

  run! if app_file == $0
end


