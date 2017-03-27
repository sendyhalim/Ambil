build:
	swift build --configuration release

install: build
	mv ./.build/release/Ambil /usr/local/bin/ambil

regenerate-xcode:
	swift package generate-xcodeproj

test:
	cp Package.swift .Package.swift.bak
	cp .Package.test.swift Package.swift
	swift test
	mv .Package.swift.bak Package.swift

.PHONY: build install regenerate-xcode test
