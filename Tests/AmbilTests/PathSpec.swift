import Spectre
@testable import AmbilUtils

public func pathSpec() {
  describe(".isRelativeFromHomeDirectory") { _ in
    describe("when given ~/test path") { test in
      test.it("should return true with ~/") {
        let path = Path("~/test")
        try expect(path.isRelativeFromHomeDirectory) == true
      }

      test.it("should return false with invalid home path ~./") {
        let path = Path("~./test")
        try expect(path.isRelativeFromHomeDirectory) == false
      }

      test.it("should return false root path /test") {
        let path = Path("/test")
        try expect(path.isRelativeFromHomeDirectory) == false
      }
    }
  }
}
