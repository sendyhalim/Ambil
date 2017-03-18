import Spectre
@testable import AmbilUtils

public func configSpec() {
  describe("GenericConfig.matchedConfigType") { test in
    describe("PatternConfig") { test in
      test.it("should matches with pattern 'random.txt$'") {
        let config = GenericConfig(directory: "/random", ext: nil, pattern: "random.txt$").matchedConfigType

        try expect(config.matches(downloadUrl: "http://hmmm/random.txt")) == true
      }

      test.it("should matches with pattern '(.png|.jpg)'") {
        let config = GenericConfig(directory: "/random", ext: nil, pattern: "(.png)|(.jpg)").matchedConfigType

        try expect(config.matches(downloadUrl: "http://hmmm/random.png")) == true
        try expect(config.matches(downloadUrl: "http://hmmm/random.jpg")) == true
      }
    }

    describe("FileExtensionConfig") { test in
      test.it("should matches with file extension") {
        let config = GenericConfig(directory: "/music", ext: ".mp4", pattern: nil).matchedConfigType

        try expect(config.matches(downloadUrl: "http://test.com/yo.mp4")) == true
      }
    }
  }
}
