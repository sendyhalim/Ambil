import Regex
import Argo
import Curry
import Runes

public protocol Config {
  var destinationDirectory: String { get }
  
  ///  Check if the given download url and destination should be used with this config
  ///
  ///  - parameter downloadUrl: Download url
  ///
  ///  - returns: `Bool`
  func matches(downloadUrl: String) -> Bool
}

struct GenericConfig {
  let directory: String
  var ext: String?
  var pattern: String?
  var matchedConfigType: Config {
    if ext != nil {
      return FileExtensionConfig(ext: ext!, directory: directory)
    } else {
      return PatternConfig(pattern: pattern!, directory: directory)
    }
  }
}

extension GenericConfig: Decodable {
  static func decode(_ json: JSON) -> Decoded<GenericConfig> {
    return curry(GenericConfig.init)
      <^> json <| "directory"
      <*> json <|? "extension"
      <*> json <|? "pattern"
  }
}

struct FileExtensionConfig: Config {
  let ext: String
  let directory: String

  var destinationDirectory: String {
    return directory
  }

  func matches(downloadUrl: String) -> Bool {
    return downloadUrl.hasSuffix(ext)
  }
}

struct PatternConfig: Config {
  let pattern: String
  let directory: String

  var destinationDirectory: String {
    return directory
  }

  func matches(downloadUrl: String) -> Bool {
    return try! Regex(string: pattern).matches(downloadUrl)
  }
}
