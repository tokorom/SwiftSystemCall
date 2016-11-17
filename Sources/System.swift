import Foundation

// MARK: - System

final public class System {
    public lazy var process = Process()

    public func call(_ command: String) -> Result {
        return call([command])
    }

    public func call(_ commands: [String]) -> Result {
        process.launchPath = "/bin/sh"
        process.arguments = ["-c"] + commands

        process.standardOutput = Pipe()
        process.standardError = Pipe()

        process.launch()

        return Result(process: process)
    }
}

// MARK: - Result

extension System {
    public struct Result {
        public let process: Process

        public var stdout: FileHandle {
            return (process.standardOutput as? Pipe ?? Pipe()).fileHandleForReading
        }

        public var stderr: FileHandle {
            return (process.standardError as? Pipe ?? Pipe()).fileHandleForReading
        }

        public var data: Data {
            return stdout.readDataToEndOfFile()
        }

        public var string: String {
            return String(data: data, encoding: .utf8) ?? ""
        }

        public var lines: [String] {
            return string.characters.split(separator: "\n").map { String($0) }
        }
    }
}
