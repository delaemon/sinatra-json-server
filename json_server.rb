require 'sinatra'
require 'json'

get '/' do
  params.to_json()
end

get '/:filename' do
  fp = "./data/#{params['filename']}.json"
  if !File.exist?(fp)
    status 400
    return "not found #{fp}"
  end
  jd = File.read(fp)
  jd.to_json()
end

post '/' do
  body = request.body.read
  if body == ''
    status 400
  else
    body.to_json()
  end
end
