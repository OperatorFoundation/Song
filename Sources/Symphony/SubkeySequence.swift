//
//  SubkeySequence.swift
//  AST
//
//  Created by Dr. Brandon Wiley on 7/10/20.
//

import Foundation

public struct SubkeySequence<T> where T: Codable
{
    let rootPath: URL
    let symphony: Symphony
    
    public init(symphony: Symphony, rootPath: URL)
    {
        self.rootPath = rootPath
        self.symphony = symphony
    }
}

extension SubkeySequence
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

public struct SubkeySequenceIterator<T>: IteratorProtocol where T: Codable
{
    public typealias Element = T
    
    let sequence: SubkeySequence<T>
    var offset: Int = 0

    public mutating func next() -> T?
    {
        guard offset < self.sequence.count else {return nil}
        let oldIndex = offset
        offset += 1
        return self.sequence[oldIndex]
    }
}

extension SubkeySequence: Sequence
{
    public typealias Iterator = SubkeySequenceIterator<T>
    
    public __consuming func makeIterator() -> SubkeySequenceIterator<T>
    {
        return SubkeySequenceIterator(sequence: self)
    }
}

extension SubkeySequence: Collection, MutableCollection
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
        
        set(newValue)
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
            let _ = self.symphony.writeValue(value: newValue, at: valuePath)
        }
    }
    
    public func index(after i: Int) -> Int
    {
        return i + 1
    }
}

extension SubkeySequence: RangeReplaceableCollection
{
    public init()
    {
        // FIXME: What is the right thing to do here?
        self.init(symphony: Symphony("database"), rootPath: URL(fileURLWithPath: ""))
    }
    
    public mutating func replaceSubrange<C, R>(_ subrange: R, with newElements: C) where C : Collection, R : RangeExpression, Self.Element == C.Element, Self.Index == R.Bound {
        
        /*
         https://developer.apple.com/documentation/swift/array/3126958-replacesubrange
         
         If you pass a zero-length range as the subrange parameter, this method inserts the elements of newElements at subrange.startIndex. Calling the insert(contentsOf:at:) method instead is preferred.
         
         Likewise, if you pass a zero-length collection as the newElements parameter, this method removes the elements in the given subrange without replacement. Calling the removeSubrange(_:) method instead is preferred.
         */
        guard let range = subrange as? Range<Int> else {return}
        if range.count == 0
        {
            self.insert(contentsOf: newElements, at: range.startIndex)
        }
        else if newElements.count == 0
        {
            self.removeSubrange(range)
        }
        else
        {
            print("Error! Unsupported case")
        }
    }
    
    mutating public func insert(_ newElement: T, at i: Int)
    {
        self[i] = newElement
    }
}

extension SubkeySequence: BidirectionalCollection
{
    public func index(before i: Int) -> Int
    {
        return i - 1
    }
}

extension SubkeySequence: RandomAccessCollection
{
}
