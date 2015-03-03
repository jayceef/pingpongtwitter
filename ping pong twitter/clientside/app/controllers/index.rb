require 'sinatra'

# before do
#   if request.request_method == 'OPTIONS'
#     response.headers["Access-Control-Allow-Origin"] = '*'
#     response.headers["Access-Control-Allow-Methods"] = 'POST'

#     halt 200
#   end
# end

options '/' do
  response.headers["Access-Control-Allow-Origin"] = '*'
  response.headers["Access-Control-Allow-Methods"] = 'POST'
end

get '/' do
  erb :index
end

post '/register' do

  erb :register
end


options '/*' do
  response["Access-Control-Allow-Headers"] = "origin, x-requested-with, content-type"
end

