//
//  SongKeyedDecodingContainer.swift
//  Song
//
//  Created by Brandon Wiley on 12/28/17.
//

import Foundation
import AST
import Parser
import Source

public class SongKeyedDecodingContainer<K: CodingKey>: KeyedDecodingContainerProtocol {
    public typealias Key = K

    public let codingPath: [CodingKey]
    public var allKeys: [K] = []

    let decoder: SongDecoder
    let data: Data
    let expression: FunctionCallExpression?
    
    public init(decoder: SongDecoder, codingPath: [CodingKey], data: Data) {
        self.decoder=decoder
        self.codingPath=codingPath
        self.data=data
        self.expression = try? Song.unwrapStruct(data: self.data, codingPath: self.codingPath)
    }
    
    public func contains(_ key: K) -> Bool {
        return false
    }
    
    public func decodeNil(forKey key: K) throws -> Bool {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 3"))

    }
    
    public func decode(_ type: Bool.Type, forKey key: K) throws -> Bool {
        guard let result = unwrapBool(key: key) else
        {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 4"))
        }
        return result
    }
    
    public func decode(_ type: Int.Type, forKey key: K) throws -> Int {
        guard let result = unwrapInt(key: key) else
        {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 5"))
        }
        return result
    }
    
    public func decode(_ type: Int8.Type, forKey key: K) throws -> Int8 {
        guard let result = unwrapInt8(key: key) else
        {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 6"))
        }
        return result
    }
    
    public func decode(_ type: Int16.Type, forKey key: K) throws -> Int16 {
        guard let result = unwrapInt16(key: key) else
        {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 7"))
        }
        return result
    }
    
    public func decode(_ type: Int32.Type, forKey key: K) throws -> Int32 {
        guard let result = unwrapInt32(key: key) else
        {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 8"))
        }
        return result
    }
    
    public func decode(_ type: Int64.Type, forKey key: K) throws -> Int64 {
        guard let result = unwrapInt64(key: key) else
        {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 9"))
        }
        return result
    }
    
    public func decode(_ type: UInt.Type, forKey key: K) throws -> UInt {
        guard let result = unwrapUInt(key: key) else
        {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 10"))
        }
        return result
    }
    
    public func decode(_ type: UInt8.Type, forKey key: K) throws -> UInt8 {
        guard let result = unwrapUInt8(key: key) else
        {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 11"))
        }
        return result
    }
    
    public func decode(_ type: UInt16.Type, forKey key: K) throws -> UInt16 {
        guard let result = unwrapUInt16(key: key) else
        {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 12"))
        }
        return result
    }
    
    public func decode(_ type: UInt32.Type, forKey key: K) throws -> UInt32 {
        guard let result = unwrapUInt32(key: key) else
        {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 32"))
        }
        return result
    }
    
    public func decode(_ type: UInt64.Type, forKey key: K) throws -> UInt64 {
        guard let result = unwrapUInt64(key: key) else
        {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 14"))
        }
        return result
    }
    
    public func decode(_ type: Float.Type, forKey key: K) throws -> Float {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 15"))

    }
    
    public func decode(_ type: Double.Type, forKey key: K) throws -> Double {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 16"))

    }
    
    public func decode(_ type: String.Type, forKey key: K) throws -> String {
        guard let result = unwrapString(key: key) else
        {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 17"))
        }
        return result
    }
    
    public func decode<T>(_ type: T.Type, forKey key: K) throws -> T where T : Decodable {
        guard let result = try unwrapStruct(T.self, forKey: key) else
        {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 18"))
        }
        return result
    }
    
    public func unwrapStruct<T>(_ type: T.Type, forKey key: K) throws -> T? where T : Decodable
    {
        guard let exp = self.expression else { return nil }
        guard let args = exp.argumentClause else { return nil }
        let arg = findNamedArg(args: args, key: key)
        guard let value = arg as? FunctionCallExpression else { return nil }

        guard let identifierEx = value.postfixExpression as? IdentifierExpression else { return nil }
        switch identifierEx.kind
        {
            case .identifier(let identifier, _):
                switch identifier
                {
                    case .name(let name):
                        guard name == "\(T.self)" else { return nil }
                    
                        let name = IdentifierPattern(identifier: Identifier.name("value"), typeAnnotation: TypeAnnotation(type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: Identifier.name("Data"))])))
                        let initializer: PatternInitializer = PatternInitializer(pattern: name, initializerExpression: value)
                        let decl = ConstantDeclaration(initializerList: [initializer])
                        let top = TopLevelDeclaration(statements: [decl], comments: [], shebang: nil)
                        let s = top.textDescription
                        guard let data = s.data(using: .utf8) else { return nil }
                    
                        let song = SongDecoder()
                        return try song.decode(type, from: data)
                    default:
                        return nil
                }
            default:
                return nil
        }
    }
    
    public func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: K) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 19"))

    }
    
    public func nestedUnkeyedContainer(forKey key: K) throws -> UnkeyedDecodingContainer {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 20"))

    }
    
    public func superDecoder() throws -> Decoder {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 21"))

    }
    
    public func superDecoder(forKey key: K) throws -> Decoder {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 22"))

    }
        
    func unwrap(key: K) -> LiteralExpression.Kind?
    {
        guard let exp = self.expression else { return nil }
        guard let args = exp.argumentClause else { return nil }
        let arg = findNamedArg(args: args, key: key)
        guard let lit = arg as? LiteralExpression else { return nil }
        let kind = lit.kind
        return kind
    }
    
    func findNamedArg(args: [AST.FunctionCallExpression.Argument], key: K) -> Expression?
    {
        for arg in args
        {
            switch arg
            {
                case .namedExpression(let name, let exp):
                    switch name
                    {
                        case .name(let s):
                            if s == key.stringValue
                            {
                                return exp
                            }
                            else
                            {
                                continue
                            }
                        default:
                            continue
                    }
                default:
                    continue
            }
        }
        
        return nil
    }
    
    func unwrapString(key: K) -> String?
    {
        guard let kind = unwrap(key: key) else { return nil }
        
        switch kind
        {
            case LiteralExpression.Kind.staticString(let value, _):
                return value
            default:
                return nil
        }
    }
    
    func unwrapInt(key: K) -> Int?
    {
        guard let kind = unwrap(key: key) else { return nil }
        
        switch kind
        {
            case LiteralExpression.Kind.integer(let value, _):
                return value
            default:
                return nil
        }
    }
    
    func unwrapInt8(key: K) -> Int8?
    {
        guard let int = unwrapInt(key: key) else { return nil }
        return Int8(int)
    }
    
    func unwrapInt16(key: K) -> Int16?
    {
        guard let int = unwrapInt(key: key) else { return nil }
        return Int16(int)
    }
    
    func unwrapInt32(key: K) -> Int32?
    {
        guard let int = unwrapInt(key: key) else { return nil }
        return Int32(int)
    }
    
    func unwrapInt64(key: K) -> Int64?
    {
        guard let int = unwrapInt(key: key) else { return nil }
        return Int64(int)
    }
    
    func unwrapUInt(key: K) -> UInt?
    {
        guard let int = unwrapInt(key: key) else { return nil }
        return UInt(int)
    }
    
    func unwrapUInt8(key: K) -> UInt8?
    {
        guard let int = unwrapInt(key: key) else { return nil }
        return UInt8(int)
    }
    
    func unwrapUInt16(key: K) -> UInt16?
    {
        guard let int = unwrapInt(key: key) else { return nil }
        return UInt16(int)
    }
    
    func unwrapUInt32(key: K) -> UInt32?
    {
        guard let int = unwrapInt(key: key) else { return nil }
        return UInt32(int)
    }
    
    func unwrapUInt64(key: K) -> UInt64?
    {
        guard let int = unwrapInt(key: key) else { return nil }
        return UInt64(int)
    }
    
    func unwrapBool(key: K) -> Bool?
    {
        guard let kind = unwrap(key: key) else { return nil }
        
        switch kind
        {
            case LiteralExpression.Kind.boolean(let value):
                return value
            default:
                return nil
        }
    }
}

func unwrapStruct(data: Data, codingPath: [CodingKey]) throws -> FunctionCallExpression {
    guard let ast = getAST(data: data) else {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 27"))
    }
    
    guard ast.statements.count == 1 else {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Wrong number of top level statements"))
    }
    
    let stmt = ast.statements[0]
    
    switch stmt {
        case is ConstantDeclaration:
            let decl = stmt as! ConstantDeclaration
            let inis = decl.initializerList
            guard inis.count == 1 else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Wrong number of initializers"))
                
            }
        
            let pat: PatternInitializer = inis[0]
            let maybeEx = pat.initializerExpression
            guard let ex = maybeEx else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Missing initializer expression"))
            }
            switch ex {
                case is FunctionCallExpression:
                    let f = ex as! FunctionCallExpression
                    return f
                default:
                    throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Initializer expression is not literal expression"))
            }
        default:
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Top level statement was not constant declaration"))
    }
}


func getAST(data: Data) -> TopLevelDeclaration? {
    guard let s = String(bytes: data, encoding: .utf8) else {
        return nil
    }
    
    let source = SourceFile(content: s)
    let parser = Parser(source: source)
    
    guard let topLevelDecl = try? parser.parse() else {
        return nil
    }
    
    return topLevelDecl
}
