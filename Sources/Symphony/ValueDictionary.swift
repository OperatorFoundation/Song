//
//  ValueDictionary.swift
//  
//
//  Created by Dr. Brandon Wiley on 5/20/20.
//

import Foundation

public struct ValueDictionary<K,V> where K: Codable, V: Codable, K: CustomStringConvertible
{
    let path: URL
    let relativePath: URL
    let symphony: Symphony

    public init(symphony: Symphony, path: URL, relativePath: URL)
    {
        self.path = path
        self.relativePath = relativePath
        self.symphony = symphony
    }
}

extension ValueDictionary
{
    public var count: Int
    {
        do
        {
            // Check if file exists.
            if FileManager.default.fileExists(atPath: path.path)
            {
                // File exists.
                let files = try FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
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

//public struct ValueDictionaryIterator<K,V>: IteratorProtocol where K: Codable, V: Codable
//{
//    public typealias Element = (K,V)
//    
//    let sequence: ValueDictionary<K,V>
//    var offset: Int = 0
//
//    public mutating func next() -> (K,V)?
//    {
//        guard offset < self.sequence.count else {return nil}
//        let oldIndex = offset
//        offset += 1
//        return self.sequence[oldIndex]
//    }
//}
//
//extension ValueDictionary: Sequence
//{
//    public typealias Iterator = ValueDictionaryIterator<K,V>
//    
//    public __consuming func makeIterator() -> ValueDictionaryIterator<K,V>
//    {
//        return ValueDictionaryIterator(sequence: self)
//    }
//}
//

extension ValueDictionary
{
    public func get(_ key: K) -> V?
    {
        let filename = key.description
        let valuePath = self.relativePath.appendingPathComponent(filename)
        let result = self.symphony.readValue(type: V.self, at: valuePath)
        return result
    }

    public func set(_ key: K, _ value: V) -> Bool
    {
        let filename = key.description
        let valuePath = self.relativePath.appendingPathComponent(filename)
        return self.symphony.writeValue(value: value, at: valuePath)
    }
}

//
//extension ValueDictionary: BidirectionalCollection
//{
//    public func index(before i: Int) -> Int
//    {
//        return i - 1
//    }
//}
//
//extension ValueSequence: RandomAccessCollection
//{
//}
