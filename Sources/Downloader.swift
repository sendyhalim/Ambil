import Alamofire
import Foundation

struct Downloader {
  func download(path: String, to destination: String, done: @escaping () -> ()) {
    let filename = path
      .characters
      .split(separator: "/")
      .map(String.init)
      .last!
    // let path =
    let targetPath = "file://\(destination)/\(filename)"
    
    let destination: DownloadRequest.DownloadFileDestination = { _, _ in
      (URL(string: targetPath)!, [.removePreviousFile, .createIntermediateDirectories])
    }

    Alamofire
      .download(path, to: destination)
      .downloadProgress { progress in
        print("Download progress: \(progress.fractionCompleted)")
      }
      .response { _ in
        print("Done!")
        done()
      }
  }
}

