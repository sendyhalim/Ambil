import Spectre

public func pathSpec() {
  describe("test") { test in
    test.it("should fail") {
      try expect(false) == false
    }
  }
}
