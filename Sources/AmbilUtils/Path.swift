//
//  Path.swift
//  Ambil
//
//  Created by Sendy Halim on 12/31/16.
//
//

import Foundation

public struct Path {
  let path: String

  public init(_ path: String) {
    self.path = path
  }
}

public extension Path {
  static private let fileManager = FileManager.default

  var currentDirectory: String {
    return Path.fileManager.currentDirectoryPath
  }

  public var isRelativeFromHomeDirectory: Bool {
    return path.hasPrefix("~/")
  }

  public var isRelativeFromCurrentDirectory: Bool {
    return path.hasPrefix(".")
  }

  public var absolute: String {
    if isRelativeFromHomeDirectory {
      let str = NSString(string: path)

      return str.abbreviatingWithTildeInPath
    } else if isRelativeFromCurrentDirectory {
      let str =  NSString(string: "\(currentDirectory)/\(path)")

      return str.standardizingPath
    } else {
      return path
    }
  }
}
