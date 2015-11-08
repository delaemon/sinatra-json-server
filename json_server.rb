require 'sinatra'
require 'json'

get '/' do
  params.to_json()
end

post '/' do
  body = request.body.read
  if body == ''
    status 400
  else
    body.to_json()
  end
end
