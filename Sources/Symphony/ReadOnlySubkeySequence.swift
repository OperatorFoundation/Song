//
//  SubkeySequence.swift
//  AST
//
//  Created by Dr. Brandon Wiley on 7/10/20.
//

import Foundation

public struct ReadOnlySubkeySequence<T> where T: Codable
{
    let rootPath: URL
    let symphony: Symphony
    
    public init(symphony: Symphony, rootPath: URL)
    {
        self.rootPath = rootPath
        self.symphony = symphony
    }
}

extension ReadOnlySubkeySequence
{
    public var count: Int
    {
        do
        {
            // Check if file exists.
            if FileManager.default.fileExists(atPath: rootPath.path)
            {
                // File exists.
                let files = try FileManager.default.contentsOfDirectory(at: rootPath, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
                var counted = 0
                for file in files
                {
                    if !file.lastPathComponent.starts(with: "_")
                    {
                        counted = counted + 1
                    }
                }
                
                return counted
            }
            else
            {
                return 0
            }
        }
        catch
        {
            return 0
        }
    }
}

public struct ReadOnlySubkeySequenceIterator<T>: IteratorProtocol where T: Codable
{
    public typealias Element = T
    
    let sequence: ReadOnlySubkeySequence<T>
    var offset: Int = 0

    public mutating func next() -> T?
    {
        guard offset < self.sequence.count else {return nil}
        let oldIndex = offset
        offset += 1
        return self.sequence[oldIndex]
    }
}

extension ReadOnlySubkeySequence: Sequence
{
    public typealias Iterator = ReadOnlySubkeySequenceIterator<T>
    
    public __consuming func makeIterator() -> ReadOnlySubkeySequenceIterator<T>
    {
        return ReadOnlySubkeySequenceIterator(sequence: self)
    }
}

extension ReadOnlySubkeySequence: Collection
{
    public typealias Index = Int
    
    public var startIndex: Index
    {
        return 0
    }
    
    public var endIndex: Index
    {
        return self.count
    }
    
    public subscript(position: Int) -> T
    {
        get
        {
            let files = try? FileManager.default.contentsOfDirectory(at: rootPath, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            var counted = 0
            var maybeFile: URL? = nil
            for file in files!
            {
                if !file.lastPathComponent.starts(with: "_")
                {
                    counted = counted + 1
                }
                
                if counted == position
                {
                    maybeFile = file
                    break
                }
            }

            let filename = maybeFile!.lastPathComponent
            
            let valuePath = self.rootPath.appendingPathComponent(filename)
            let result = self.symphony.readValue(type: T.self, at: valuePath)
            return result!
        }
    }
    
    public func index(after i: Int) -> Int
    {
        return i + 1
    }
}

extension ReadOnlySubkeySequence: BidirectionalCollection
{
    public func index(before i: Int) -> Int
    {
        return i - 1
    }
}

extension ReadOnlySubkeySequence: RandomAccessCollection
{
}
