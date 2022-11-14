LOCAL_BIN=$(CURDIR)/bin

GOOSE_BIN=$(LOCAL_BIN)/goose
GOOSE_TAG=v2.6.0
GOOSE_URL=https://github.com/pressly/goose/releases/download/$(GOOSE_TAG)/goose-$(shell uname -s | tr '[:upper:]' '[:lower:]')64
$(GOOSE_BIN):
	mkdir -p bin
	wget -O $(GOOSE_BIN) $(GOOSE_URL)
	chmod +x $(GOOSE_BIN)

.PHONY: up
up:
	docker-compose up -d

.PHONY: migrate
migrate: $(GOOSE_BIN)
	$(GOOSE_BIN) -dir migration postgres "postgresql://root:root@localhost:5432/postgres?sslmode=disable" up

.PHONY: register
register:
	curl -d @register_connector.json -H "Content-Type: application/json" http://localhost:8083/connectors/
