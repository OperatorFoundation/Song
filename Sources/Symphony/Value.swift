//
//  Value.swift
//  
//
//  Created by Dr. Brandon Wiley on 5/20/20.
//

import Foundation
import Song

let typename = "_type.song"
let valuename = "_value.song"

struct ValueType: Codable
{
    let type: String
}

extension Symphony
{
    // MARK: - Simple Atomic Operations
    public func clear() -> Bool
    {
        let dirPath = self.root

        do
        {
            // Check if file exists
            if FileManager.default.fileExists(atPath: dirPath.path)
            {
                // File exists
                // Try to remove it
                try FileManager.default.removeItem(at: dirPath)

                return true
            }
            else
            {
                return true
            }
        }
        catch
        {
            return false
        }
    }
    
    public func createValue<T>(value: T, at path: URL) -> Bool where T: Codable
    {
        guard let dirPath = fixPathAndCreate(path: path) else {return false}
        let realPath = dirPath.appendingPathComponent(valuename)
        let typePath = dirPath.appendingPathComponent(typename)

        do
        {
            print(realPath.path)
            // Check if file already exists
            if FileManager.default.fileExists(atPath: realPath.path)
            {
                // File exists.
                return false
            }
            else
            {
                // File does not exist, try to create it.
                let song = SongEncoder()
                guard let encoded = try? song.encode(value) else
                {
                    return false
                }
                
                try encoded.write(to: realPath)
                
                let valuetype = ValueType(type: "\(T.self)")
                
                guard let typeEncoded = try? song.encode(valuetype) else
                {
                    return false
                }
                
                try typeEncoded.write(to: typePath)
                
                return true

            }
        }
        catch
        {
            return false
        }
    }
    
    public func deleteValue(at path: URL) -> Bool
    {
        let dirPath = fixPath(path: path)
        let realPath = dirPath.appendingPathComponent(valuename)
        let typePath = dirPath.appendingPathComponent(typename)

        do
        {
            // Check if file exists
            if FileManager.default.fileExists(atPath: realPath.path)
            {
                // File exists
                // Try to remove it
                try FileManager.default.removeItem(at: realPath)
                try FileManager.default.removeItem(at: typePath)

                return true
            }
            else
            {
                return false
            }
        }
        catch
        {
            return false
        }
    }
    
    public func readValue<T>(type: T.Type, at path: URL) -> T? where T: Codable
    {
        let dirPath = fixPath(path: path)
        let realPath = dirPath.appendingPathComponent(valuename)
        let typePath = dirPath.appendingPathComponent(typename)

        do
        {
            // Check if file exists
            if FileManager.default.fileExists(atPath: realPath.path)
            {
                // File exists
                // Try to read it
                let song = SongDecoder()

                let typeData = try Data(contentsOf: typePath)
                let typeResult: ValueType = try song.decode(ValueType.self, from: typeData)
                guard typeResult.type == "\(T.self)" else {return nil}
                
                let data = try Data(contentsOf: realPath)
                let result = try song.decode(T.self, from: data)
                return result
            }
            else
            {
                return nil
            }
        }
        catch
        {
            return nil
        }
    }
    
    public func writeValue<T>(value: T, at path: URL) -> Bool where T: Codable
    {
        guard let dirPath = fixPathAndCreate(path: path) else {return false}
        let realPath = dirPath.appendingPathComponent(valuename)
        let typePath = dirPath.appendingPathComponent(typename)

        let song = SongEncoder()
        guard let encoded = try? song.encode(value) else
        {
            return false
        }
        
        do
        {
            try encoded.write(to: realPath)

            let valuetype = ValueType(type: "\(T.self)")
            
            guard let typeEncoded = try? song.encode(valuetype) else
            {
                return false
            }
            
            try typeEncoded.write(to: typePath)
            
            return true
        }
        catch
        {
            return false
        }
    }

    // MARK: - Combined Atomic Operations
    public func writeValueIfExists<T>(value: T, at path: URL) -> Bool where T: Codable
    {
        guard let dirPath = fixPathAndCreate(path: path) else {return false}
        let realPath = dirPath.appendingPathComponent(valuename)
        let typePath = dirPath.appendingPathComponent(typename)

        do
        {
            // Check if file already exists
            if FileManager.default.fileExists(atPath: realPath.path)
            {
                // File exists.
                return false
            }
            else
            {
                // File does not exist, try to create it.
                let song = SongEncoder()
                guard let encoded = try? song.encode(value) else
                {
                    return false
                }
                
                try encoded.write(to: realPath)
                
                let valuetype = ValueType(type: "\(T.self)")
                
                guard let typeEncoded = try? song.encode(valuetype) else
                {
                    return false
                }
                
                try typeEncoded.write(to: typePath)
                
                return true
            }
        }
        catch
        {
            return false
        }
    }
    
    public func readValueAndDelete<T>(type: T, at path: URL) -> T? where T: Codable
    {
        guard let value = readValue(type: T.self, at: path) else {return nil}
        let _ = deleteValue(at: path)
        return value
    }
    
    public func readValueAndWrite<T>(value: T, at path: URL) -> T? where T: Codable
    {
        guard let oldValue = readValue(type: T.self, at: path) else {return nil}
        let _ = writeValue(value: value, at: path)
        return oldValue
    }
    
    // MARK: - Utility Functions
    func fixPath(path: URL) -> URL
    {
        return self.root.appendingPathComponent(path.relativePath)
    }
    
    func fixPathIfExists(path: URL) -> URL?
    {
        let dirPath = fixPath(path: path)
        do
        {
            // Check if directory already exists
            if FileManager.default.fileExists(atPath: dirPath.path)
            {
                return dirPath
            }
            else
            {
                return nil
            }
        }
        catch
        {
            return nil
        }
    }
    
    func fixPathAndCreate(path: URL) -> URL?
    {
        let dirPath = fixPath(path: path)
        do
        {
            // Check if directory already exists
            if !FileManager.default.fileExists(atPath: dirPath.path)
            {
                // Directory does not exist
                // Try to create it
                try FileManager.default.createDirectory(at: dirPath, withIntermediateDirectories: true, attributes: nil)
            }
            
            return dirPath
        }
        catch
        {
            print(error)
            return nil
        }
    }
}
