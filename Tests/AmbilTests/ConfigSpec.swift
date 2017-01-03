import Spectre
@testable import AmbilUtils

public func configSpec() {
  describe("GenericConfig.matchedConfigType") { test in
    test.it("should matches with file extension") {
      let config = GenericConfig(directory: "/music", ext: ".mp4", pattern: nil).matchedConfigType

      try expect(config.matches(downloadUrl: "http://test.com/yo.mp4")) == true
    }

    test.it("should return pattern config") {
      let config = GenericConfig(directory: "/random", ext: nil, pattern: "random.txt$").matchedConfigType

      try expect(config.matches(downloadUrl: "http://hmmm/random.txt")) == true
    }
  }
}
