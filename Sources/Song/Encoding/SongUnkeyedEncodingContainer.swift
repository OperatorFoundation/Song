//
//  SongUnkeyedEncodingContainer.swift
//  Song
//
//  Created by Brandon Wiley on 12/26/17.
//

import Foundation

import AST
import Parser
import Source

public class SongUnkeyedEncodingContainer: UnkeyedEncodingContainer {
    var encoder: Encoder
    let single: SongSingleValueEncodingContainer
    public var codingPath: [CodingKey]
    public var count: Int {
        get {
            return contents.count
        }
    }
    public var data: Data? {
        get {
            return wrapValue(type: type, contents: contents)
        }
    }
    var type: Type
    var contents: [Expression] = []
    
    public init(encoder: Encoder, codingPath: [CodingKey], type: Type = AnyType() as Type) {
        self.encoder=encoder
        self.codingPath=codingPath
        self.single=encoder.singleValueContainer() as! SongSingleValueEncodingContainer
        self.type=type
    }
    
    public func encodeNil() throws {
        contents.append(single.literal(kind: LiteralExpression.Kind.`nil`))
        type=AnyType() as Type
    }
    
    public func encode(_ value: Bool) throws {
        contents.append(single.literal(kind: LiteralExpression.Kind.boolean(value)))
    }
    
    public  func encode(_ value: Int) throws {
        contents.append(single.literal(kind: LiteralExpression.Kind.integer(value, String(describing: value))))
    }
    
    public  func encode(_ value: Int8) throws {
        contents.append(single.literal(kind: LiteralExpression.Kind.integer(Int(value), String(describing: value))))
    }
    
    public  func encode(_ value: Int16) throws {
        contents.append(single.literal(kind: LiteralExpression.Kind.integer(Int(value), String(describing: value))))
    }
    
    public  func encode(_ value: Int32) throws {
        contents.append(single.literal(kind: LiteralExpression.Kind.integer(Int(value), String(describing: value))))
    }
    
    public  func encode(_ value: Int64) throws {
        contents.append(single.literal(kind: LiteralExpression.Kind.integer(Int(value), String(describing: value))))
    }
    
    public  func encode(_ value: UInt) throws {
        contents.append(single.literal(kind: LiteralExpression.Kind.integer(Int(value), String(describing: value))))
    }
    
    public  func encode(_ value: UInt8) throws {
        contents.append(single.literal(kind: LiteralExpression.Kind.integer(Int(value), String(describing: value))))
    }
    
    public  func encode(_ value: UInt16) throws {
        contents.append(single.literal(kind: LiteralExpression.Kind.integer(Int(value), String(describing: value))))
    }
    
    public  func encode(_ value: UInt32) throws {
        contents.append(single.literal(kind: LiteralExpression.Kind.integer(Int(value), String(describing: value))))
    }
    
    public  func encode(_ value: UInt64) throws {
        contents.append(single.literal(kind: LiteralExpression.Kind.integer(Int(value), String(describing: value))))
    }
    
    public  func encode(_ value: Float) throws {
        contents.append(single.literal(kind: LiteralExpression.Kind.floatingPoint(Double(value), String(describing: value))))
    }
    
    public  func encode(_ value: Double) throws {
        contents.append(single.literal(kind: LiteralExpression.Kind.floatingPoint(value, String(describing: value))))
    }
    
    public  func encode(_ value: String) throws {
        contents.append(single.literal(kind: LiteralExpression.Kind.staticString(value, "\""+value+"\"")))
    }
    
    public  func encode<T>(_ value: T) throws where T : Encodable {
        let song = SongEncoder()
        let encoded = try song.encode(value)
//        guard let ast = getAST(data: encoded) else
//        {
//            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 100"))
//        }
        let result = try unwrapStruct(data: encoded, codingPath: [])
        contents.append(result)
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
    
    func unwrapStruct(data: Data, codingPath: [CodingKey]) throws -> FunctionCallExpression
    {
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
                guard let ex = maybeEx else
                {
                    throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Missing initializer expression"))
                }
                switch ex
                {
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

    public func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        return KeyedEncodingContainer<NestedKey>(SongKeyedEncodingContainer(encoder: encoder, codingPath: codingPath, containerType: nil))
    }
    
    public func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        return SongUnkeyedEncodingContainer(encoder: encoder, codingPath: codingPath)
    }
    
    public func superEncoder() -> Encoder {
        return encoder
    }
    
    func wrapValue(type: Type, contents: [Expression]) -> Data {
        let name = IdentifierPattern(identifier: Identifier.name("value"), typeAnnotation: TypeAnnotation(type: ArrayType(elementType: type)))
        let value = LiteralExpression(kind: LiteralExpression.Kind.array(contents))
        let initializer: PatternInitializer = PatternInitializer(pattern: name, initializerExpression: value)
        let decl = ConstantDeclaration(initializerList: [initializer])
        let top = TopLevelDeclaration(statements: [decl], comments: [], shebang: nil)
        let s = top.textDescription
        let d = s.data(using: .utf8)
        return d!
    }
}
