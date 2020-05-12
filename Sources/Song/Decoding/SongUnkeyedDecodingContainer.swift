//
//  SongUnkeyedDecodingContainer.swift
//  Song
//
//  Created by Brandon Wiley on 12/28/17.
//

import Foundation

import AST

public class SongUnkeyedDecodingContainer: UnkeyedDecodingContainer {
    public var codingPath: [CodingKey]
    public var count: Int?
    public var isAtEnd: Bool
    public var currentIndex: Int
    public var expressions: [Expression]
    public var results: [Any]?

    let decoder: SongDecoder
    let data: Data
    let single: SongSingleValueDecodingContainer
    
    public init(decoder: SongDecoder, codingPath: [CodingKey], data: Data) {
        self.codingPath=codingPath
        count=nil
        isAtEnd=false
        currentIndex=0
        expressions=[]
        results=nil
        
        self.decoder=decoder
        self.data=data

        single = decoder._singleValueContainer()
        do {
            let list = try single.unwrap()
            switch list.kind {
                case LiteralExpression.Kind.array(let exp):
                    expressions = exp
                    count = expressions.count
                    if count == 0 {
                        isAtEnd=true
                    }
                default:
                    expressions = []
            }
        } catch {
            expressions = []
        }
    }
    
    public func decodeNil() throws -> Bool {
        guard let c = count else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        guard currentIndex < c else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        let ex = expressions[currentIndex]
        switch ex {
            case is LiteralExpression:
                let lit = ex as! LiteralExpression
                return single.literalNil(lit)
            default:
                return false
        }
    }
    
    public func decode(_ type: Bool.Type) throws -> Bool {
        guard let c = count else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        guard currentIndex < c else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        let ex = expressions[currentIndex]
        currentIndex=currentIndex+1
        if currentIndex == count {
            isAtEnd=true
        }
        switch ex {
        case is LiteralExpression:
            let lit = ex as! LiteralExpression
            do {
                let result = try single.literal(Bool.self, lit)
                return result
            } catch {
                throw error
            }
        default:
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Element was not Bool"))
        }
    }
    
    public func decode(_ type: Int.Type) throws -> Int {
        guard let c = count else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        guard currentIndex < c else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        let ex = expressions[currentIndex]
        currentIndex=currentIndex+1
        if currentIndex == count {
            isAtEnd=true
        }
        switch ex {
        case is LiteralExpression:
            let lit = ex as! LiteralExpression
            do {
                let result = try single.literal(Int.self, lit)
                return result
            } catch {
                throw error
            }
        default:
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Element was not Int"))
        }
    }
    
    public func decode(_ type: Int8.Type) throws -> Int8 {
        guard let c = count else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        guard currentIndex < c else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        let ex = expressions[currentIndex]
        currentIndex=currentIndex+1
        if currentIndex == count {
            isAtEnd=true
        }
        switch ex {
        case is LiteralExpression:
            let lit = ex as! LiteralExpression
            do {
                let result = try single.literal(Int8.self, lit)
                return result
            } catch {
                throw error
            }
        default:
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Element was not Int8"))
        }
    }
    
    public func decode(_ type: Int16.Type) throws -> Int16 {
        guard let c = count else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        guard currentIndex < c else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        let ex = expressions[currentIndex]
        currentIndex=currentIndex+1
        if currentIndex == count {
            isAtEnd=true
        }
        switch ex {
        case is LiteralExpression:
            let lit = ex as! LiteralExpression
            do {
                let result = try single.literal(Int16.self, lit)
                return result
            } catch {
                throw error
            }
        default:
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Element was not Int16"))
        }
    }
    
    public func decode(_ type: Int32.Type) throws -> Int32 {
        guard let c = count else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        guard currentIndex < c else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        let ex = expressions[currentIndex]
        currentIndex=currentIndex+1
        if currentIndex == count {
            isAtEnd=true
        }
        switch ex {
        case is LiteralExpression:
            let lit = ex as! LiteralExpression
            do {
                let result = try single.literal(Int32.self, lit)
                return result
            } catch {
                throw error
            }
        default:
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Element was not Int32"))
        }
    }
    
    public func decode(_ type: Int64.Type) throws -> Int64 {
        guard let c = count else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        guard currentIndex < c else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        let ex = expressions[currentIndex]
        currentIndex=currentIndex+1
        if currentIndex == count {
            isAtEnd=true
        }
        switch ex {
        case is LiteralExpression:
            let lit = ex as! LiteralExpression
            do {
                let result = try single.literal(Int64.self, lit)
                return result
            } catch {
                throw error
            }
        default:
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Element was not Int64"))
        }
    }
    
    public func decode(_ type: UInt.Type) throws -> UInt {
        guard let c = count else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        guard currentIndex < c else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        let ex = expressions[currentIndex]
        currentIndex=currentIndex+1
        if currentIndex == count {
            isAtEnd=true
        }
        switch ex {
        case is LiteralExpression:
            let lit = ex as! LiteralExpression
            do {
                let result = try single.literal(UInt.self, lit)
                return result
            } catch {
                throw error
            }
        default:
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Element was not UInt"))
        }
    }
    
    public func decode(_ type: UInt8.Type) throws -> UInt8 {
        guard let c = count else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        guard currentIndex < c else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        let ex = expressions[currentIndex]
        currentIndex=currentIndex+1
        if currentIndex == count {
            isAtEnd=true
        }
        switch ex {
        case is LiteralExpression:
            let lit = ex as! LiteralExpression
            do {
                let result = try single.literal(UInt8.self, lit)
                return result
            } catch {
                throw error
            }
        default:
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Element was not UInt8"))
        }
    }
    
    public func decode(_ type: UInt16.Type) throws -> UInt16 {
        guard let c = count else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        guard currentIndex < c else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        let ex = expressions[currentIndex]
        currentIndex=currentIndex+1
        if currentIndex == count {
            isAtEnd=true
        }
        switch ex {
        case is LiteralExpression:
            let lit = ex as! LiteralExpression
            do {
                let result = try single.literal(UInt16.self, lit)
                return result
            } catch {
                throw error
            }
        default:
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Element was not UInt16"))
        }
    }
    
    public func decode(_ type: UInt32.Type) throws -> UInt32 {
        guard let c = count else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        guard currentIndex < c else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        let ex = expressions[currentIndex]
        currentIndex=currentIndex+1
        if currentIndex == count {
            isAtEnd=true
        }
        switch ex {
        case is LiteralExpression:
            let lit = ex as! LiteralExpression
            do {
                let result = try single.literal(UInt32.self, lit)
                return result
            } catch {
                throw error
            }
        default:
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Element was not UInt32"))
        }
    }
    
    public func decode(_ type: UInt64.Type) throws -> UInt64 {
        guard let c = count else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        guard currentIndex < c else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        let ex = expressions[currentIndex]
        currentIndex=currentIndex+1
        if currentIndex == count {
            isAtEnd=true
        }
        switch ex {
        case is LiteralExpression:
            let lit = ex as! LiteralExpression
            do {
                let result = try single.literal(UInt64.self, lit)
                return result
            } catch {
                throw error
            }
        default:
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Element was not UInt64"))
        }
    }
    
    public func decode(_ type: Float.Type) throws -> Float {
        guard let c = count else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        guard currentIndex < c else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        let ex = expressions[currentIndex]
        currentIndex=currentIndex+1
        if currentIndex == count {
            isAtEnd=true
        }
        switch ex {
        case is LiteralExpression:
            let lit = ex as! LiteralExpression
            do {
                let result = try single.literal(Float.self, lit)
                return result
            } catch {
                throw error
            }
        default:
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Element was not Float"))
        }
    }
    
    public func decode(_ type: Double.Type) throws -> Double {
        guard let c = count else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        guard currentIndex < c else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        let ex = expressions[currentIndex]
        currentIndex=currentIndex+1
        if currentIndex == count {
            isAtEnd=true
        }
        switch ex {
        case is LiteralExpression:
            let lit = ex as! LiteralExpression
            do {
                let result = try single.literal(Double.self, lit)
                return result
            } catch {
                throw error
            }
        default:
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Element was not Float"))
        }
    }
    
    public func decode(_ type: String.Type) throws -> String {
        guard let c = count else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        guard currentIndex < c else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        let ex = expressions[currentIndex]
        currentIndex=currentIndex+1
        if currentIndex == count {
            isAtEnd=true
        }
        switch ex {
        case is LiteralExpression:
            let lit = ex as! LiteralExpression
            do {
                let result = try single.literal(String.self, lit)
                return result
            } catch {
                throw error
            }
        default:
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Element was not String"))
        }
    }
    
    public func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        switch type
        {
            case is Data.Type:
                do
                {
                    let result = try decodeData()
                    return result as! T
                }
                catch(let error)
                {
                    throw error
                }
            default:
                return try decodeStruct(T.self)
        }
    }
    
    public func decodeData() throws -> Data {
        guard let c = count else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        guard currentIndex < c else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        let ex = expressions[currentIndex]
        currentIndex=currentIndex+1
        if currentIndex == count
        {
            isAtEnd=true
        }
        
        switch ex {
            case is FunctionCallExpression:
                let lit = ex as! FunctionCallExpression
                do
                {
                    guard let result = try single.literal(Data.self, lit) else
                    {
                        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Element was not Data"))
                    }
                    
                    return result
                }
                catch
                {
                    throw error
                }
            default:
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Element was not Data"))
        }
    }

    public func decodeStruct<T>(_ type: T.Type) throws -> T where T : Decodable {
        guard let c = count else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        guard currentIndex < c else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "No more elements in list"))
        }
        
        let ex = expressions[currentIndex]
        currentIndex=currentIndex+1
        if currentIndex == count
        {
            isAtEnd=true
        }
        
        switch ex {
            case is FunctionCallExpression:
                let lit = ex as! FunctionCallExpression
                do
                {
                    return try literalStruct(T.self, lit)
                }
                catch
                {
                    throw error
                }
            default:
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Element was not Data"))
        }
    }
        
    func literalStruct<T>(_ type: T.Type, _ lit: FunctionCallExpression) throws -> T where T : Decodable {
        do {
            let name = lit.postfixExpression.textDescription
            print(name)
                        
            let song = self.decoder
            let single = SongEncoder()._singleValueContainer()
            let litData = single.wrapStruct(value: lit, type: type)
            let litString = litData.string
            print(litString)
            let result = try song.decode(T.self, from: litData)
            return result            
        } catch {
            print(error)
            throw error
        }
    }
    
    public func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 30"))

    }
    
    public func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 31"))

    }
    
    public func superDecoder() throws -> Decoder {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 32"))

    }
}
