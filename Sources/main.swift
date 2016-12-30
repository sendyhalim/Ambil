import Commander
import Foundation

//let main = command {  (source: String) in
//  let downloader = Downloader()
//  print("Downloading \(source)...")
//
//  downloader.download(path: source, to: "/Users/sendyhalim/development/code/projects/ambil")
//}
//
//main.run()

let sema = DispatchSemaphore(value: 0)
let source = "https://www.google.co.id/images/branding/googlelogo/2x/googlelogo_color_120x44dp.png"
let downloader = Downloader()
print("Downloading \(source)...")

downloader.download(path: source, to: "/Users/sendyhalim/development/code/projects/ambil") {
  sema.signal()
}

sema.wait()
