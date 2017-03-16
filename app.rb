require 'sinatra'
require 'httparty'
require 'pry'

def call_api(path)
  HTTParty.get "http://lacedeamon.spartaglobal.com/todos#{path}"
end

get '/' do
  @todos = call_api('/')
  binding.pry
  erb :index
end

get '/new' do
  erb :create_todo
end

get '/:id' do |id|
  @todo = call_api("/#{id}")
  erb :todo
end
