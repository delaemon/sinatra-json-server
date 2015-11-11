require 'sinatra'
require 'json'
require 'yaml'

#============#
# Reflection #
#============#
get '/' do
  params.to_json()
end

post '/' do
  body = request.body.read
  if body == ''
    status 400
    return
  end
  data = JSON.parse(body)
  data = JSON.pretty_generate(data)
  data
end

#==========#
# Resource #
#==========#
get '/:filename' do
  json_path = "./data/#{params['filename']}.json"
  if File.exist?(json_path)
      file = File.read(json_path)
      data = JSON.parse(file)
      data = JSON.pretty_generate(data)
      return data
  end

  yaml_path = "./data/#{params['filename']}.yaml"
  if File.exist?(yaml_path)
      data = YAML.load_file(yaml_path)
      data = JSON.pretty_generate(data)
      return data
  end

  status 400
  "Not found #{params['filename']}(.json|.yaml)"
end

post '/:filename' do
  body = request.body.read
  json_path = "./data/#{params['filename']}.json"
  if File.exist?(json_path)
    status 400
    return "File #{json_path} already exists"
  end
  data = JSON.parse(body)
  data = JSON.pretty_generate(data)
  File.write(json_path, data)

  status 201
  "Created #{params['filename']}"
end

put '/:filename' do
  body = request.body.read
  json_path = "./data/#{params['filename']}.json"
  isFileExist = File.exist?(json_path)
  data = JSON.parse(body)
  data = JSON.pretty_generate(data)
  File.write(json_path, data)
  if isFileExist
    status 200
    return "Updated #{params['filename']}"
  end

  status 201
  "Created #{params['filename']}"
end

delete '/:filename' do
  json_path = "./data/#{params['filename']}.json"
  if !File.exist?(json_path)
    status 204
    return
  end
  File.delete(json_path)
  status 200
  "Deleted #{params['filename']}"
end
