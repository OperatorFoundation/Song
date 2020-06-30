//
//  ValueSequence.swift
//  
//
//  Created by Dr. Brandon Wiley on 5/20/20.
//

import Foundation

public struct ValueSequence<T> where T: Codable
{
    let rootPath: URL
    let relativePath: URL
    let symphony: Symphony
    
    public init(rootPath: URL, relativePath: URL)
    {
        self.rootPath = rootPath
        self.relativePath = relativePath
        self.symphony = Symphony(root: rootPath)
    }
}

extension ValueSequence
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
                return files.count
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

public struct ValueSequenceIterator<T>: IteratorProtocol where T: Codable
{
    public typealias Element = T
    
    let sequence: ValueSequence<T>
    var offset: Int = 0

    public mutating func next() -> T?
    {
        guard offset < self.sequence.count else {return nil}
        let oldIndex = offset
        offset += 1
        return self.sequence[oldIndex]
    }
}

extension ValueSequence: Sequence
{
    public typealias Iterator = ValueSequenceIterator<T>
    
    public __consuming func makeIterator() -> ValueSequenceIterator<T>
    {
        return ValueSequenceIterator(sequence: self)
    }
}

extension ValueSequence: Collection, MutableCollection
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
            let filename = position.string
            let valuePath = self.relativePath.appendingPathComponent(filename)
            let result = self.symphony.readValue(type: T.self, at: valuePath)
            return result!
        }
        
        set(newValue)
        {
            let filename = position.string
            let valuePath = self.relativePath.appendingPathComponent(filename)
            let _ = self.symphony.writeValue(value: newValue, at: valuePath)
        }
    }
    
    public func index(after i: Int) -> Int
    {
        return i + 1
    }
}

extension ValueSequence: RangeReplaceableCollection
{
    public init()
    {
        // FIXME: What is the right thing to do here?
        self.init(rootPath: URL(fileURLWithPath: ""), relativePath: URL(fileURLWithPath: ""))
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

extension ValueSequence: BidirectionalCollection
{
    public func index(before i: Int) -> Int
    {
        return i - 1
    }
}

extension ValueSequence: RandomAccessCollection
{
}
