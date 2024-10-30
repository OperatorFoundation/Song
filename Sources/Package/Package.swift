import Foundation

public struct Package
{
    public let name: String
    public let type: PackageType
    
    public init(name: String, type: PackageType = .library)
    {
        self.name = name
        self.type = type
        
        guard let _ = try? FileManager.default.createDirectory(atPath: self.name, withIntermediateDirectories: false, attributes: nil) else { return }
        
        let process = Process()
        process.currentDirectoryURL = URL(string: self.name)
        process.executableURL = URL(string: "/usr/bin/swift")
        
        switch self.type
        {
            case .library:
                process.arguments = ["package", "init", "--type", "library"]
            case .executable:
                process.arguments = ["package", "init", "--type", "executable"]
        }
        
        guard let _ = try? process.run() else { return }
        process.waitUntilExit()
    }
    
    public func update()
    {
        let process = Process()
        process.currentDirectoryURL = URL(string: self.name)
        process.executableURL = URL(string: "/usr/bin/swift")
        
        process.arguments = ["package", "update"]
        
        process.launch()
        process.waitUntilExit()
    }
    
    public func build()
    {
        let process = Process()
        process.currentDirectoryURL = URL(string: self.name)
        process.executableURL = URL(string: "/usr/bin/swift")
        
        process.arguments = ["build", "-Xswiftc", "-target", "-Xswiftc", "x86_64-apple-macosx10.14"]
        
        guard let _ = try? process.run() else { return }
        process.waitUntilExit()
    }
    
    public func run() -> Data
    {
        let process = Process()
        process.currentDirectoryURL = URL(string: self.name)
        process.executableURL = URL(string: "/usr/bin/swift")
        
        process.arguments = ["run"]
        let output = Pipe()
        process.standardOutput = output
        let handle = output.fileHandleForReading
        
        process.launch()
        process.waitUntilExit()
        
        let data = handle.readDataToEndOfFile()
        return data
    }
}

public enum PackageType
{
    case library
    case executable
}
