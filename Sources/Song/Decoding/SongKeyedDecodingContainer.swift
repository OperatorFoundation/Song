//
//  SongKeyedDecodingContainer.swift
//  Song
//
//  Created by Brandon Wiley on 12/28/17.
//

import Foundation

public class SongKeyedDecodingContainer<K: CodingKey>: KeyedDecodingContainerProtocol {
    public typealias Key = K

    public let codingPath: [CodingKey]
    public var allKeys: [K] = []

    let decoder: SongDecoder
    let data: Data
    
    public init(decoder: SongDecoder, codingPath: [CodingKey], data: Data) {
        self.decoder=decoder
        self.codingPath=codingPath
        self.data=data
    }
    
    public func contains(_ key: K) -> Bool {
        return false
    }
    
    public func decodeNil(forKey key: K) throws -> Bool {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
    
    public func decode(_ type: Bool.Type, forKey key: K) throws -> Bool {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
    
    public func decode(_ type: Int.Type, forKey key: K) throws -> Int {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
    
    public func decode(_ type: Int8.Type, forKey key: K) throws -> Int8 {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
    
    public func decode(_ type: Int16.Type, forKey key: K) throws -> Int16 {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
    
    public func decode(_ type: Int32.Type, forKey key: K) throws -> Int32 {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
    
    public func decode(_ type: Int64.Type, forKey key: K) throws -> Int64 {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
    
    public func decode(_ type: UInt.Type, forKey key: K) throws -> UInt {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
    
    public func decode(_ type: UInt8.Type, forKey key: K) throws -> UInt8 {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
    
    public func decode(_ type: UInt16.Type, forKey key: K) throws -> UInt16 {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
    
    public func decode(_ type: UInt32.Type, forKey key: K) throws -> UInt32 {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
    
    public func decode(_ type: UInt64.Type, forKey key: K) throws -> UInt64 {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
    
    public func decode(_ type: Float.Type, forKey key: K) throws -> Float {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
    
    public func decode(_ type: Double.Type, forKey key: K) throws -> Double {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
    
    public func decode(_ type: String.Type, forKey key: K) throws -> String {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
    
    public func decode<T>(_ type: T.Type, forKey key: K) throws -> T where T : Decodable {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
    
    public func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: K) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
    
    public func nestedUnkeyedContainer(forKey key: K) throws -> UnkeyedDecodingContainer {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
    
    public func superDecoder() throws -> Decoder {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
    
    public func superDecoder(forKey key: K) throws -> Decoder {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type"))

    }
}
