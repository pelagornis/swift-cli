import Foundation

/// To enable logging, create an empty file under `/tmp/commandline_log`. Logging will append to the
/// end of this file.
///
/// You can monitor the log live using:
/// ```
/// tail -f /tmp/commandline_log
/// ```
@MainActor
public func log(_ item: Any, terminator: String = "\n") {
    print(item, terminator: terminator, to: &logStream)
}

@MainActor var logStream = LogStream()

struct LogStream: TextOutputStream {
    func write(_ string: String) {
        let logURL = URL(fileURLWithPath: "/tmp/commandline_log")
        guard let data = string.data(using: .utf8) else {
            assertionFailure("Cannot write to log")
            return
        }
        if let fileHandle = try? FileHandle(forWritingTo: logURL) {
            fileHandle.seekToEndOfFile()
            fileHandle.write(data)
            fileHandle.closeFile()
        }
    }
}

