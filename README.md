# Elixoral

(under development)

## Development

Install protoc plugin:

    mix escript.install hex protobuf

API proto gen:

    protoc --elixir_out=plugins=grpc:./lib/ -I native/sdk-core/protos/api_upstream/ $(find native/sdk-core/protos/api_upstream/temporal/ -iname "*.proto")

Core proto gen:

    protoc --elixir_out=plugins=grpc:./lib/temporal/core/api --elixir_opt=package_prefix=temporal -I native/sdk-core/protos/api_upstream/ -I native/sdk-core/protos/local/ $(find native/sdk-core/protos/local/temporal/sdk -iname "*.proto")

TODO: Clean up these paths