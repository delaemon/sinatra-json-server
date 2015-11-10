require 'sinatra'
require 'json'
require 'yaml'

get '/' do
  params.to_json()
end

get '/:filename' do
  json_path = "./data/#{params['filename']}.json"
  if File.exist?(json_path)
      file = File.read(json_path)
      data = JSON.parse(file)
      return data.to_json
  end

  yaml_path = "./data/#{params['filename']}.yaml"
  if File.exist?(yaml_path)
      data = YAML.load_file(yaml_path)
      return data.to_json
  end

  status 400
  return "not found #{params['filename']}(.json|.yaml)"
end

post '/' do
  body = request.body.read
  if body == ''
    status 400
  else
    data = JSON.parse(body)
    data.to_json
  end
end

post '/:filename' do
  body = request.body.read
  json_path = "./data/#{params['filename']}.json"
  if File.exist?(json_path)
    status 400
    "File #{json_path} already exists"
  end
  data = JSON.parse(body)
  data = JSON.pretty_generate(data)
  File.write(json_path, data)
  status 201
  "Created #{params['filename']}"
end
