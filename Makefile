build:
	swift build --configuration release

install: build
	mv ./.build/release/Ambil /usr/local/bin/ambil

regenerate-xcode:
	swift package generate-xcodeproj

test:
	swift test

.PHONY: build install regenerate-xcode test
