//
//  ConfigLoader.swift
//  Ambil
//
//  Created by Sendy Halim on 1/3/17.
//
//

import Argo
import Foundation

enum ConfigLoaderError: Error {
  case decodeJsonError
}

public struct ConfigLoader {
  static public func loadConfig(withJSONString jsonString: String) throws -> Array<Config> {
    let jsonData: Any = try! JSONSerialization.jsonObject(
      with: jsonString.data(using: String.Encoding.utf8)!,
      options: []
    )

    let decodedConfigs: Decoded<Array<GenericConfig>> = decode(jsonData)

    switch decodedConfigs {
    case .success(let configs):
      return configs.map { $0.matchedConfigType }
    default:
      throw ConfigLoaderError.decodeJsonError
    }
  }
}
