//
//  SongKeyedEncodingContainer.swift
//  Song
//
//  Created by Brandon Wiley on 12/26/17.
//

import Foundation

import AST

typealias Parameter = (CodingKey, Expression)

public class SongKeyedEncodingContainer<K: CodingKey>: KeyedEncodingContainerProtocol {
    let encoder: Encoder
    let single: SongSingleValueEncodingContainer
    
    let containerType: String?
    
    public var codingPath: [CodingKey]
    var contents: [(K, Expression)] = []
    
    public init(encoder: Encoder, codingPath: [CodingKey], containerType: String?) {
        self.encoder=encoder
        self.codingPath=codingPath
        self.containerType=containerType
        self.single=encoder.singleValueContainer() as! SongSingleValueEncodingContainer
    }
    
    public func encodeNil(forKey key: K) throws {
        let kex = key
        let vex = single.literal(kind: LiteralExpression.Kind.`nil`)
        let tup = (kex, vex)
        contents.append(tup)
    }
    
    public func encode(_ value: Bool, forKey key: K) throws {
        let kex = key
        let vex = single.literal(kind: LiteralExpression.Kind.boolean(value))
        let tup = (kex, vex)
        contents.append(tup)
    }
    
    public func encode(_ value: Int, forKey key: K) throws {
        let kex = key
        let vex = single.literal(kind: LiteralExpression.Kind.integer(value, String(describing: value)))
        let tup = (kex, vex)
        contents.append(tup)
    }
    
    public func encode(_ value: Int8, forKey key: K) throws {
        let kex = key
        let vex = single.literal(kind: LiteralExpression.Kind.integer(Int(value), String(describing: value)))
        let tup = (kex, vex)
        contents.append(tup)
    }
    
    public func encode(_ value: Int16, forKey key: K) throws {
        let kex = key
        let vex = single.literal(kind: LiteralExpression.Kind.integer(Int(value), String(describing: value)))
        let tup = (kex, vex)
        contents.append(tup)
    }
    
    public func encode(_ value: Int32, forKey key: K) throws {
        let kex = key
        let vex = single.literal(kind: LiteralExpression.Kind.integer(Int(value), String(describing: value)))
        let tup = (kex, vex)
        contents.append(tup)
    }
    
    public func encode(_ value: Int64, forKey key: K) throws {
        let kex = key
        let vex = single.literal(kind: LiteralExpression.Kind.integer(Int(value), String(describing: value)))
        let tup = (kex, vex)
        contents.append(tup)
    }
    
    public func encode(_ value: UInt, forKey key: K) throws {
        let kex = key
        let vex = single.literal(kind: LiteralExpression.Kind.integer(Int(value), String(describing: value)))
        let tup = (kex, vex)
        contents.append(tup)
    }
    
    public func encode(_ value: UInt8, forKey key: K) throws {
        let kex = key
        let vex = single.literal(kind: LiteralExpression.Kind.integer(Int(value), String(describing: value)))
        let tup = (kex, vex)
        contents.append(tup)
    }
    
    public func encode(_ value: UInt16, forKey key: K) throws {
        let kex = key
        let vex = single.literal(kind: LiteralExpression.Kind.integer(Int(value), String(describing: value)))
        let tup = (kex, vex)
        contents.append(tup)
    }
    
    public func encode(_ value: UInt32, forKey key: K) throws {
        let kex = key
        let vex = single.literal(kind: LiteralExpression.Kind.integer(Int(value), String(describing: value)))
        let tup = (kex, vex)
        contents.append(tup)
    }
    
    public func encode(_ value: UInt64, forKey key: K) throws {
        let kex = key
        let vex = single.literal(kind: LiteralExpression.Kind.integer(Int(value), String(describing: value)))
        let tup = (kex, vex)
        contents.append(tup)
    }
    
    public func encode(_ value: Float, forKey key: K) throws {
        let kex = key
        let vex = single.literal(kind: LiteralExpression.Kind.floatingPoint(Double(value), String(describing: value)))
        let tup = (kex, vex)
        contents.append(tup)
    }
    
    public func encode(_ value: Double, forKey key: K) throws {
        let kex = key
        let vex = single.literal(kind: LiteralExpression.Kind.floatingPoint(value, String(describing: value)))
        let tup = (kex, vex)
        contents.append(tup)
    }
    
    public func encode(_ value: String, forKey key: K) throws {
        let kex = key
        let vex = single.literal(kind: LiteralExpression.Kind.staticString(value, "\""+value+"\""))
        let tup = (kex, vex)
        contents.append(tup)
    }
    
    public func literal(_ value: Data) -> Expression {
        let constructor = IdentifierExpression(kind: IdentifierExpression.Kind.identifier(Identifier.name("Data"), nil))
        let b64s = value.base64EncodedString()
        let b64lit = LiteralExpression(kind: LiteralExpression.Kind.staticString(b64s, "\""+b64s+"\""))
        let args = [FunctionCallExpression.Argument.namedExpression(Identifier.name("base64Encoded"), b64lit)]
        let lit: Expression = FunctionCallExpression(postfixExpression: constructor, argumentClause: args)
        return lit
    }
    
    public func literalForEncodable<T>(_ value: T) throws -> Expression where T: Encodable {
        do
        {
            let song = SongEncoder()
            let encoded = try song.encode(value)
            
            let decoder = SongDecoder()
            let decoderContainer = SongSingleValueDecodingContainer(decoder: decoder, codingPath: codingPath, data: encoded)
            return try decoderContainer.unwrapStruct()
        }
        catch let encodeError
        {
            print("Error encoding \(value): \(encodeError)")
            throw(encodeError)
        }
    }
    
    public func encode<T>(_ value: T, forKey key: K) throws where T : Encodable {
        switch value
        {
            case is Data:
                guard let data = value as? Data else
                {
                    throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 300"))
                }
                let lit = literal(data)
                contents.append((key, lit))
            default:
                let lit = try literalForEncodable(value)
                contents.append((key, lit))
        }
    }
    
    public func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type, forKey key: K) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        let container: SongKeyedEncodingContainer<NestedKey> = SongKeyedEncodingContainer<NestedKey>(encoder: encoder, codingPath: codingPath, containerType: nil)
        return KeyedEncodingContainer<NestedKey>(container)
    }
    
    public func nestedUnkeyedContainer(forKey key: K) -> UnkeyedEncodingContainer {
        return SongUnkeyedEncodingContainer(encoder: encoder, codingPath: codingPath)
    }
    
    public func superEncoder() -> Encoder {
        return self.encoder
    }
    
    public func superEncoder(forKey key: K) -> Encoder {
        return self.encoder
    }
    
    func literal(containerType: String, contents: [(K, Expression)]) -> Expression {
        let constructor = IdentifierExpression(kind: IdentifierExpression.Kind.identifier(Identifier.name(containerType.description), nil))
        var args: [FunctionCallExpression.Argument] = []
        for (key, value) in contents {
            args.append(FunctionCallExpression.Argument.namedExpression(Identifier.name(key.stringValue), value))
        }
        let lit: Expression = FunctionCallExpression(postfixExpression: constructor, argumentClause: args)
        return lit
    }

    func wrapValue(containerType: String, contents: [(K, Expression)]) -> Data {
        let constructor = IdentifierExpression(kind: IdentifierExpression.Kind.identifier(Identifier.name(containerType.description), nil))
        var args: [FunctionCallExpression.Argument] = []
        for (key, value) in contents {
            args.append(FunctionCallExpression.Argument.namedExpression(Identifier.name(key.stringValue), value))
        }
        let lit: Expression = FunctionCallExpression(postfixExpression: constructor, argumentClause: args)
        
        let name = IdentifierPattern(identifier: Identifier.name("value"), typeAnnotation: TypeAnnotation(type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: Identifier.name(containerType.description))])))
        let initializer: PatternInitializer = PatternInitializer(pattern: name, initializerExpression: lit)
        let decl = ConstantDeclaration(initializerList: [initializer])
        let top = TopLevelDeclaration(statements: [decl], comments: [], shebang: nil)
        let s = top.textDescription
        let d = s.data(using: .utf8)
        return d!
    }
}

extension SongKeyedEncodingContainer: Datable {    
    public var data: Data? {
        get {
            guard let type = containerType else {
                NSLog("keyed container has no container type set")
                return nil
            }
            
            return wrapValue(containerType: type, contents: contents)
        }
    }
    
    public var expression: Expression? {
        get {
            guard let type = containerType else {
                NSLog("keyed container has no container type set")
                return nil
            }
            
            return literal(containerType: type, contents: contents)
        }
    }
}
