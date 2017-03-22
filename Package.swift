import PackageDescription

let package = Package(
  name: "Ambil",
  targets: [
    Target(name: "AmbilUtils"),
    Target(name: "Ambil", dependencies: ["AmbilUtils"])
  ],
  dependencies: [
    .Package(url: "https://github.com/Alamofire/Alamofire", majorVersion: 4),
    .Package(url: "https://github.com/kylef/Commander", majorVersion: 0),
    .Package(url: "https://github.com/thoughtbot/Argo", majorVersion: 4),
    .Package(url: "https://github.com/thoughtbot/Curry", majorVersion: 3),
    .Package(url: "https://github.com/sharplet/Regex", majorVersion: 0),
    .Package(url: "https://github.com/Quick/Quick", majorVersion: 1, minor: 1),
    .Package(url: "https://github.com/Quick/Nimble", majorVersion: 6)
  ]
);

