import Alamofire
import Foundation

public struct Downloader {
  static public func download(downloadUrl: String, to destinationDirectory: String, done: @escaping (String) -> ()) {
    let filename = downloadUrl
      .characters
      .split(separator: "/")
      .map(String.init)
      .last!

    let path = Path("\(destinationDirectory)/\(filename)")
    
    let targetPath = "file://\(path.absolute)"

    let destination: DownloadRequest.DownloadFileDestination = { _, _ in
      (URL(string: targetPath)!, [.removePreviousFile, .createIntermediateDirectories])
    }

    let queue = DispatchQueue.global(qos: .default)

    Alamofire
      .download(downloadUrl, to: destination)
      .downloadProgress(queue: queue) { progress in
        let progressString = String(format: "\rDownload progress %.2f%%", progress.fractionCompleted * 100)
        
        print(progressString, terminator: "")
        fflush(__stdoutp)
      }
      .response(queue: queue) { _ in
        print("") // Print newline after download is completed
        done(path.absolute)
      }
  }
}
