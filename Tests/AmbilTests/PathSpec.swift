import Foundation
import Nimble
import Quick
@testable import AmbilUtils

class PathSpec: QuickSpec {
  override func spec() {
    let fileManager = FileManager.default

    describe(".isRelativeFromHomeDirectory") {
      it("should return true with ~/") {
        let path = Path("~/test")
        expect(path.isRelativeFromHomeDirectory) == true
      }

      it("should return false with invalid home path ~./") {
        let path = Path("~./test")
        expect(path.isRelativeFromHomeDirectory) == false
      }

      it("should return false root path /test") {
        let path = Path("/test")
        expect(path.isRelativeFromHomeDirectory) == false
      }
    }

    describe("isRelativeFromCurrentDirectory") {
      it("should return true with ../") {
        let path = Path("../")
        expect(path.isRelativeFromCurrentDirectory) == true
      }

      it("should return false with invalid home path ~/") {
        let path = Path("~/test")
        expect(path.isRelativeFromCurrentDirectory) == false
      }

      it("should return false root path /test") {
        let path = Path("/test")
        expect(path.isRelativeFromCurrentDirectory) == false
      }
    }

    describe(".absolute") {
      it("should return the absolute path when given relative path") {
        let path = Path("../")
        let expected = NSString(string: "\(fileManager.currentDirectoryPath)/..").standardizingPath

        expect(path.absolute) == expected
      }

      it("should return the absolute path when given path is relative with home directory") {
        let path = Path("~/test")
        let expected = NSString(string: "~/test").standardizingPath

        expect(path.absolute) == expected
      }

      it("should not modify the absollute path when given absolute path") {
        let path = Path("/iron/man")

        expect(path.absolute) == "/iron/man"
      }

      it("should return the absolute path of hidden file in home directory") {
        let path = Path("~/.hidden")
        let expected = NSString(string: "~/.hidden").standardizingPath

        expect(path.absolute) == expected
      }
    }
  }
}

