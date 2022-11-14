# Postgres + Kafka + Debezium example

## Get started

Execute:
- `make up` - to create environment
- `make migrate` - to create migration
- `make register` - to register postgres connector

Then create records in the 'example' table and see result on http://localhost:8080/ui/docker-kafka-server/topic/example.public.example/data
