import XCTest
import Quick

@testable import AmbilUtilsTests

Quick.QCKMain([
    ConfigLoaderSpec.self,
    ConfigSpec.self,
    PathSpec.self
])
