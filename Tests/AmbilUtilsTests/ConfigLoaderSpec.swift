import Foundation
import Nimble
import Quick
@testable import AmbilUtils

class ConfigLoaderSpec: QuickSpec {
  override func spec() {
    describe("ConfigLoader.loadConfig") {
      let configString = "[" +
        "{\"extension\": \".mp4\", \"directory\": \"~/Downloads/musics\"}," +
        "{\"pattern\": \"hello\", \"directory\": \"~/Downloads/random\"}" +
      "]"

      let configs = try! ConfigLoader.loadConfig(withJSONString: configString)

      it("should return 2 configs") {
        expect(configs.count) == 2
      }
    }
  }
}
