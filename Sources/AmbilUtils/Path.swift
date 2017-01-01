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

  public var isRelativeFromHomeDirectory: Bool {
    return path.hasPrefix("~/")
  }

  public var isRelateiveFromCurrentDirectory: Bool {
    return path.hasPrefix(".")
  }
}
