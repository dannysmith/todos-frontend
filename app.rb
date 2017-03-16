require 'sinatra/base'
require 'httparty'
require 'pry'

class DemoApp < Sinatra::Base

  def call_api(path)
    HTTParty.get "http://lacedeamon.spartaglobal.com/todos#{path}"
  end

  get '/' do
    @todos = call_api('/')
    erb :index
  end

  get '/new' do
    erb :create_todo
  end

  get '/:id' do |id|
    @todo = call_api("/#{id}")
    erb :todo
  end

  get '/delete/:id' do |id|
    HTTParty.delete "http://lacedeamon.spartaglobal.com/todos/#{id}"
    redirect '/'
  end
end
