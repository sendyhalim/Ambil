import PackageDescription

let package = Package(
  name: "Ambil",
  targets: [],
  dependencies: [
    .Package(url: "https://github.com/Alamofire/Alamofire", majorVersion: 4),
    .Package(url: "https://github.com/kylef/Commander", majorVersion: 0),
    .Package(url: "https://github.com/Quick/Nimble", majorVersion: 5),
    .Package(url: "https://github.com/Quick/Quick", majorVersion: 1)
  ]
);

