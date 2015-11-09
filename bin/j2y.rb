require 'yaml'
require 'json'

puts YAML.dump JSON.load ARGF.read
