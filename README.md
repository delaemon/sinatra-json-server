# sinatra-json-server
It's simple json server. Please download to your host.
## usage
```
ruby json_server.rb
```

## endpoint
```
# Reflection
GET http://localhost:4567/?params1=one&params2=two
POST http://localhost:4567/ (with body)

# Select
GET http://localhost:4567/:resource_name

# Create
POST http://localhost:4567/:resource_name (with body)

# Update
PUT http://localhost:4567/:resource_name (with body)

# Delete
DELETE http://localhost:4567/:resource_name
```
