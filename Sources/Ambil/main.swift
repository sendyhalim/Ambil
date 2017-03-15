import Commander
import Foundation
import AmbilUtils

func destinationDirectoryFor(downloadUrl: String) -> String {
  // Load config first
  let jsonString = try! String(contentsOfFile: Path("~/.ambil").absolute)
  let configs = try! ConfigLoader.loadConfig(withJSONString: jsonString)

  for config in configs {
    if config.matches(downloadUrl: downloadUrl) {
      return config.destinationDirectory
    }
  }

  return ""
}

let main = command(
  Argument<String>("source", description: "Source url", validator: nil),
  Option<String>("destination", "", description: "Optional destination path")
) {  (source: String, destination: String) in
  let sema = DispatchSemaphore(value: 0)
  var _destination = destination
  print("Downloading \(source)...")

  if _destination.isEmpty {
    _destination = destinationDirectoryFor(downloadUrl: source)
    _destination = _destination.isEmpty ? "~/Downloads" : _destination
  }

  Downloader.download(downloadUrl: source, to: _destination) { destination in
    print("Download destination: \(destination)")
    sema.signal()
  }

  sema.wait()
}

main.run()

