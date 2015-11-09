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
      return data.to_json()
  end

  status 400
  return "not found #{params['filename']}(.json|.yaml)"
end

post '/' do
  body = request.body.read
  if body == ''
    status 400
  else
    body.to_json()
  end
end
