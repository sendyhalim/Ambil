import Foundation
import Nimble
import Quick
@testable import AmbilUtils

class ConfigSpec: QuickSpec {
  override func spec() {
    describe("GenericConfig.matchedConfigType") {
      describe("PatternConfig") {
        it("should matches with pattern 'random.txt$'") {
          let config = GenericConfig(directory: "/random", ext: nil, pattern: "random.txt$").matchedConfigType

          expect(config.matches(downloadUrl: "http://hmmm/random.txt")) == true
        }

        it("should matches with pattern '(.png|.jpg)'") {
          let config = GenericConfig(directory: "/random", ext: nil, pattern: "(.png)|(.jpg)").matchedConfigType

          expect(config.matches(downloadUrl: "http://hmmm/random.png")) == true
          expect(config.matches(downloadUrl: "http://hmmm/random.jpg")) == true
        }
      }

      describe("FileExtensionConfig") {
        it("should matches with file extension") {
          let config = GenericConfig(directory: "/music", ext: ".mp4", pattern: nil).matchedConfigType

          expect(config.matches(downloadUrl: "http://test.com/yo.mp4")) == true
        }
      }
    }
  }
}

