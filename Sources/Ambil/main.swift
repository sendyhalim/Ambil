import Commander
import Foundation
import AmbilUtils

let main = command(
  Argument<String>("source", description: "Source url", validator: nil),
  Option<String>("destination", "", description: "Optional destination path")
) {  (source: String, destination: String) in
  let sema = DispatchSemaphore(value: 0)
  print("Downloading \(source)...")

  Downloader.download(downloadUrl: source, to: destination) {
    sema.signal()
  }

  sema.wait()
}

main.run()

