build:
	swift build --configuration release

install: build
	mv ./.build/release/Ambil /usr/local/bin/ambil

regenerate-xcode:
	swift package generate-xcodeproj

.PHONY: build install regenerate-xcode
