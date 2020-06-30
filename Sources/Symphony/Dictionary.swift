//
//  Dictionary.swift
//  
//
//  Created by Dr. Brandon Wiley on 5/20/20.
//

import Foundation
import Song

let dictionaryname = "_dictionary"

extension Symphony
{
    // MARK: - Simple Atomic Operations
    public func createDictionary<K,V>(values: [K:V], at path: URL) -> ValueDictionary<K,V>? where K: Codable, V: Codable
    {
        guard let dirPath = fixPathAndCreate(path: path) else {return nil}
        let typePath = dirPath.appendingPathComponent(typename)
        let seqPath = dirPath.appendingPathComponent(sequencename)
        let seqRelPath = path.appendingPathComponent(sequencename)
        
        let newType = "Dictionary<\(K.self),\(V.self)>"
        let valueType = ValueType(type: newType)

        do
        {
            // Check if type file exists.
            if FileManager.default.fileExists(atPath: typePath.path)
            {
                return nil
            }
            else
            {
                // Type file does not exist.
                let song = SongEncoder()
                guard let encoded = try? song.encode(valueType) else
                {
                    return nil
                }
                
                try encoded.write(to: typePath)
                
                // Check if sequence path exists
                if !FileManager.default.fileExists(atPath: seqPath.path)
                {
                    // Sequence path does not exist.
                    try FileManager.default.createDirectory(at: seqPath, withIntermediateDirectories: true, attributes: nil)
                }
                
                let result = ValueDictionary<K,V>(path: seqPath, relativePath: seqRelPath)
                return result
            }
        }
        catch
        {
            return nil
        }
    }
    
    public func deleteDictionary(at path: URL) -> Bool
    {
        let dirPath = fixPath(path: path)
        let seqPath = dirPath.appendingPathComponent(sequencename)
        let typePath = dirPath.appendingPathComponent(typename)

        do
        {
            // Check if file exists
            if FileManager.default.fileExists(atPath: seqPath.path)
            {
                // File exists
                // Try to remove it
                try FileManager.default.removeItem(at: seqPath)
                try FileManager.default.removeItem(at: typePath)

                // If the directory is empty, we can remove it.
                if try FileManager.default.contentsOfDirectory(at: dirPath, includingPropertiesForKeys: nil, options: .skipsHiddenFiles).count == 0
                {
                    try FileManager.default.removeItem(at: dirPath)
                }
                
                return true
            }
            else
            {
                return false
            }
        }
        catch
        {
            print(error)
            return false
        }
    }
    
    public func readDictionary<K,V>(keyType: K.Type, valueType: V.Type, at path: URL) -> ValueDictionary<K,V>? where K: Codable, V: Codable
    {
        guard let dirPath = fixPathAndCreate(path: path) else {return nil}
        let typePath = dirPath.appendingPathComponent(typename)
        let seqPath = dirPath.appendingPathComponent(sequencename)
        let seqRelPath = path.appendingPathComponent(sequencename)
        
        let newType = "Dictionary<\(K.self),\(V.self)>"

        do
        {
            // Check if file exists
            if FileManager.default.fileExists(atPath: seqPath.path)
            {
                // Sequence file exists
                // Check type file
                if FileManager.default.fileExists(atPath: typePath.path)
                {
                    // Type file exists.
                    let data = try Data(contentsOf: typePath)
                    let song = SongDecoder()
                    let oldType = try song.decode(ValueType.self, from: data)
                    guard oldType.type == newType else {return nil}
                    return ValueDictionary<K,V>(path: seqPath, relativePath: seqRelPath)
                }
                else
                {
                    return nil
                }
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
}
