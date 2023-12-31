BIN = docker-ibug
VERSION = $(shell scripts/version)

GO ?= go
LDFLAGS = -s -w -X github.com/iBug/docker-ibug/pkg/version.Version=$(VERSION)

.PHONY: all gzip test $(BIN)

all: $(BIN)

gzip: $(BIN).gz

test:
	$(GO) test ./...

$(BIN):
	$(GO) build -ldflags="$(LDFLAGS)" .

$(BIN).gz: $(BIN)
	gzip -k9 $^
