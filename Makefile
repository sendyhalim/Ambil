build:
	swift build

regenerate-xcode:
	swift package generate-xcodeproj

.PHONY: build
