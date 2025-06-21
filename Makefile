.PHONY: build go

build:
	devcontainer build ./$(TARGET)/ \
		--config ./$(TARGET)/devcontainer.json \
		--image-name ghcr.io/callumosborn/$(TARGET)-dev-container:$(TAG)

go:
	$(MAKE) build TARGET=go TAG=latest
