import PackageDescription

let package = Package(
  name: "Ambil",
  targets: [
    Target(name: "AmbilUtils"),
    Target(name: "Ambil", dependencies: ["AmbilUtils"])
  ],
  dependencies: [
    .Package(url: "https://github.com/Alamofire/Alamofire", majorVersion: 4),
    .Package(url: "https://github.com/kylef/Commander", majorVersion: 0)
  ]
);

