PROJECT_NAME := ManaGuildsApp
XCODEGEN := xcodegen
DERIVED_DATA := .derivedData

.PHONY: help generate build clean

help:
	@echo "Targets disponiveis:"
	@echo "  make generate  - gera o projeto Xcode a partir do project.yml"
	@echo "  make build     - gera o projeto e compila para iOS generic"
	@echo "  make clean     - remove o projeto gerado e a derived data local"

generate:
	$(XCODEGEN) generate

build: generate
	xcodebuild -project $(PROJECT_NAME).xcodeproj -scheme $(PROJECT_NAME) -destination 'generic/platform=iOS' -derivedDataPath $(DERIVED_DATA) CODE_SIGNING_ALLOWED=NO build

clean:
	rm -rf $(PROJECT_NAME).xcodeproj $(DERIVED_DATA)
