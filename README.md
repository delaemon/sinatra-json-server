# sinatra-json-server
It's simple json server. Please download to your host.
## usage
```
ruby json_server.rb -p <Port>
```

## endpoint
```
# Reflection
GET http://<Host:Port>/?params1=one&params2=two
POST http://<Host:Port>/ (with body)

# Select
GET http://<Host:Port>/:resource_name

# Create
POST http://<Host:Port>/:resource_name (with body)

# Update
PUT http://<Host:Port>/:resource_name (with body)

# Delete
DELETE http://<Host:Port>/:resource_name
```
