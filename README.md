# sinatra-json-server
It's simple json server.
## setup
Please download to your host.
```
gem install sinatra
```

## usage
```
Usage: json_server [options]
    -p port                          set the port (default is 4567)
    -o addr                          set the host (default is localhost)
    -e env                           set the environment (default is development)
    -s server                        specify rack server/handler (default is thin)
    -x                               turn on the mutex lock (default is off)
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
