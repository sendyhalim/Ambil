import Spectre
import Foundation
@testable import AmbilUtils

public func pathSpec() {
  let fileManager = FileManager.default

  describe(".isRelativeFromHomeDirectory") { test in
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

  describe("isRelativeFromCurrentDirectory") { test in
    test.it("should return true with ../") {
      let path = Path("../")
      try expect(path.isRelativeFromCurrentDirectory) == true
    }

    test.it("should return false with invalid home path ~/") {
      let path = Path("~/test")
      try expect(path.isRelativeFromCurrentDirectory) == false
    }

    test.it("should return false root path /test") {
      let path = Path("/test")
      try expect(path.isRelativeFromCurrentDirectory) == false
    }
  }

  describe(".absolute") { test in
    test.it("should return the absolute path when given relative path") {
      let path = Path("../")
      let expected = NSString(string: "\(fileManager.currentDirectoryPath)/..").standardizingPath

      try expect(path.absolute) == expected
    }

    test.it("should return the absolute path when given path is relative with home directory") {
      let path = Path("~/test")
      let expected = NSString(string: "~/test").standardizingPath

      try expect(path.absolute) == expected
    }

    test.it("should not modify the absollute path when given absolute path") {
      let path = Path("/iron/man")

      try expect(path.absolute) == "/iron/man"
    }

    test.it("should return the absolute path of hidden file in home directory") {
      let path = Path("~/.hidden")
      let expected = NSString(string: "~/.hidden").standardizingPath

      try expect(path.absolute) == expected
    }
  }
}
