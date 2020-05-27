//
//  ValueDictionary.swift
//  
//
//  Created by Dr. Brandon Wiley on 5/20/20.
//

import Foundation

public struct ValueDictionary<K,V> where K: Codable, V: Codable
{
    let path: URL
    let relativePath: URL
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
//extension ValueDictionary: Collection, MutableCollection
//{
//    public typealias Index = K
//    
//    public var startIndex: Index
//    {
//        return 0
//    }
//    
//    public var endIndex: Index
//    {
//        return self.count
//    }
//    
//    public subscript(position: Index) -> V
//    {
//        get
//        {
//            let filename = position.string
//            let valuePath = self.relativePath.appendingPathComponent(filename)
//            let result = Symphony.instance.readValue(type: T.self, at: valuePath)
//            return result!
//        }
//        
//        set(newValue)
//        {
//            let filename = position.string
//            let valuePath = self.relativePath.appendingPathComponent(filename)
//            let _ = Symphony.instance.writeValue(value: newValue, at: valuePath)
//        }
//    }
//    
//    public func index(after i: Index) -> Index
//    {
//        return i + 1
//    }
//}
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
