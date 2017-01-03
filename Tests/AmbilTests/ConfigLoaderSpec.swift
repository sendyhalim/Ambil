import Spectre
@testable import AmbilUtils

public func configLoaderSpec() {
  describe("ConfigLoader.loadConfig") { test in
    let configString = "[" +
      "{\"extension\": \".mp4\", \"directory\": \"~/Downloads/musics\"}," +
      "{\"pattern\": \"hello\", \"directory\": \"~/Downloads/random\"}" +
    "]"

    let configs = try! ConfigLoader.loadConfig(withJSONString: configString)

    test.it("should return 2 configs") {
      try expect(configs.count) == 2
    }
  }
}
