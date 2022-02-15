require 'sinatra'

class Mcairbnb < Sinatra::Base

  get '/index' do
    @first_name = params[:first_name]
    @surname_name = params[:surname_name]
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


