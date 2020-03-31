//
//  SongSingleValueEncodingContainer.swift
//  Song
//
//  Created by Brandon Wiley on 12/26/17.
//

import Foundation

import AST

import Song

typealias EncodableDictionary<K,V> = Dictionary<K, V> where K: Encodable & Hashable, V: Encodable

public class SongSingleValueEncodingContainer: SingleValueEncodingContainer {
    public var encoder: Encoder
    public var codingPath: [CodingKey]
    public var data: Data?
    
    public init(encoder: Encoder, codingPath: [CodingKey]) {
        self.encoder=encoder
        self.codingPath=codingPath
    }
    
    public func encodeNil() throws {
        self.data = wrapValue(kind: LiteralExpression.Kind.`nil`, type: AnyType() as Type)
    }
    
    public func encode(_ value: Bool) throws {
        self.data = wrapValue(kind: LiteralExpression.Kind.boolean(value), type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: "Bool")]))
    }
    
    public func encode(_ value: Int) throws {
        self.data = wrapValue(kind: LiteralExpression.Kind.integer(value, String(value)), type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: "Int")]))
    }
    
    public func encode(_ value: Int8) throws {
        self.data = wrapValue(kind: LiteralExpression.Kind.integer(Int(value), String(value)), type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: "Int8")]))
    }
    
    public func encode(_ value: Int16) throws {
        self.data = wrapValue(kind: LiteralExpression.Kind.integer(Int(value), String(value)), type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: "Int16")]))
    }
    
    public func encode(_ value: Int32) throws {
        self.data = wrapValue(kind: LiteralExpression.Kind.integer(Int(value), String(value)), type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: "Int32")]))
    }
    
    public func encode(_ value: Int64) throws {
        self.data = wrapValue(kind: LiteralExpression.Kind.integer(Int(value), String(value)), type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: "Int64")]))
    }
    
    public func encode(_ value: UInt) throws {
        self.data = wrapValue(kind: LiteralExpression.Kind.integer(Int(value), String(value)), type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: "UInt")]))
    }
    
    public func encode(_ value: UInt8) throws {
        self.data = wrapValue(kind: LiteralExpression.Kind.integer(Int(value), String(value)), type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: "UInt8")]))
    }
    
    public func encode(_ value: UInt16) throws {
        self.data = wrapValue(kind: LiteralExpression.Kind.integer(Int(value), String(value)), type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: "UInt16")]))
    }
    
    public func encode(_ value: UInt32) throws {
        self.data = wrapValue(kind: LiteralExpression.Kind.integer(Int(value), String(value)), type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: "UInt32")]))
    }
    
    public func encode(_ value: UInt64) throws {
        self.data = wrapValue(kind: LiteralExpression.Kind.integer(Int(value), String(value)), type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: "UInt64")]))
    }
    
    public func encode(_ value: Float) throws {
        self.data = wrapValue(kind: LiteralExpression.Kind.floatingPoint(Double(value), String(value)), type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: "Float")]))
    }
    
    public func encode(_ value: Double) throws {
        self.data = wrapValue(kind: LiteralExpression.Kind.floatingPoint(value, String(value)), type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: "Double")]))
    }
    
    public func encode(_ value: String) throws {
        self.data = wrapValue(kind: LiteralExpression.Kind.staticString(value, "\""+value+"\""), type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: "String")]))
    }
    
    public func encode<T>(_ value: T) throws where T : Encodable {
        switch value {
        case is Date:
            throw EncodingError.unsupportedType("Date")
        case is Data:
            do {
                try encode(value as! Data)
            } catch {
                throw error
            }
        case is UUID:
            do {
                try encode(value as! UUID)
            } catch {
                throw error
            }
        case is Decimal:
            do {
                try encode(value as! Decimal)
            } catch {
                throw error
            }
        case is URL:
            throw EncodingError.unsupportedType("URL")
        case is Decimal:
            throw EncodingError.unsupportedType("Decimal")
        case let daa as Dictionary<AnyHashable, Any>:
            guard let (firstKey, firstValue) = daa.first else {
                // FIXME - encode empty dictionary with unspecialized types
                return
            }
            
//            let keyType = bruteForceType(firstKey) // FIXME - Won't work for non-special case items.
            let keyType = String(String(describing: type(of: firstKey.base)).split(separator: " ")[0])
            let valueType = String(String(describing: type(of: firstValue)).split(separator: " ")[0])

            let ex = literal(dictionary: daa)
            
            self.data = wrapDictionary(keyType: keyType, valueType: valueType, literal: ex)
        default:
            let song = self.encoder as! SongEncoder
            let t = type(of: value as Any)
            let s = String("\(t)".split(separator: " ")[0])
            song.nextKeyedType=s
            try value.encode(to: self.encoder)
            self.data = song.nextKeyedContainer!.data
        }
    }
    
    func encode(_ value: Decimal) throws {
        let name = IdentifierPattern(identifier: "value", typeAnnotation: TypeAnnotation(type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: "Decimal")])))
        let lit = literal(value)
        let initializer: PatternInitializer = PatternInitializer(pattern: name, initializerExpression: lit)
        let decl = ConstantDeclaration(initializerList: [initializer])
        let top = TopLevelDeclaration(statements: [decl], comments: [], shebang: nil)
        let s = top.textDescription
        self.data = s.data(using: .utf8)
    }
    
    public func literal(_ value: Decimal) -> Expression {
        let constructor = IdentifierExpression(kind: IdentifierExpression.Kind.identifier("Decimal", nil))
        let uuids = value.description
        let lit = LiteralExpression(kind: LiteralExpression.Kind.staticString(uuids, "\""+uuids+"\""))
        let args = [FunctionCallExpression.Argument.namedExpression("string", lit)]
        let result: Expression = FunctionCallExpression(postfixExpression: constructor, argumentClause: args)
        return result
    }
    
    func encode(_ value: UUID) throws {
        let name = IdentifierPattern(identifier: "value", typeAnnotation: TypeAnnotation(type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: "UUID")])))
        let lit = literal(value)
        let initializer: PatternInitializer = PatternInitializer(pattern: name, initializerExpression: lit)
        let decl = ConstantDeclaration(initializerList: [initializer])
        let top = TopLevelDeclaration(statements: [decl], comments: [], shebang: nil)
        let s = top.textDescription
        self.data = s.data(using: .utf8)
    }
    
    public func literal(_ value: UUID) -> Expression {
        let constructor = IdentifierExpression(kind: IdentifierExpression.Kind.identifier("UUID", nil))
        let uuids = value.uuidString
        let lit = LiteralExpression(kind: LiteralExpression.Kind.staticString(uuids, "\""+uuids+"\""))
        let args = [FunctionCallExpression.Argument.namedExpression("uuidString", lit)]
        let result: Expression = FunctionCallExpression(postfixExpression: constructor, argumentClause: args)
        return result
    }
    
    func encode(_ value: Data) throws {
        let name = IdentifierPattern(identifier: "value", typeAnnotation: TypeAnnotation(type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: "Data")])))
        let lit = literal(value)
        let initializer: PatternInitializer = PatternInitializer(pattern: name, initializerExpression: lit)
        let decl = ConstantDeclaration(initializerList: [initializer])
        let top = TopLevelDeclaration(statements: [decl], comments: [], shebang: nil)
        let s = top.textDescription
        self.data = s.data(using: .utf8)
    }
    
    public func literal(_ value: Data) -> Expression {
        let constructor = IdentifierExpression(kind: IdentifierExpression.Kind.identifier("Data", nil))
        let b64s = value.base64EncodedString()
        let b64lit = LiteralExpression(kind: LiteralExpression.Kind.staticString(b64s, "\""+b64s+"\""))
        let args = [FunctionCallExpression.Argument.namedExpression("base64Encoded", b64lit)]
        let lit: Expression = FunctionCallExpression(postfixExpression: constructor, argumentClause: args)
        return lit
    }
    
    private func wrapValue(kind: LiteralExpression.Kind, type: Type) -> Data {
        let name = IdentifierPattern(identifier: "value", typeAnnotation: TypeAnnotation(type: type))
        let value = literal(kind: kind)
        let initializer: PatternInitializer = PatternInitializer(pattern: name, initializerExpression: value)
        let decl = ConstantDeclaration(initializerList: [initializer])
        let top = TopLevelDeclaration(statements: [decl], comments: [], shebang: nil)
        let s = top.textDescription
        let d = s.data(using: .utf8)
        return d!
    }

    private func wrapDictionary(keyType: String, valueType: String, literal: Expression) -> Data {
        let name = IdentifierPattern(identifier: "value", typeAnnotation: TypeAnnotation(type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: "Dictionary<\(keyType), \(valueType)>")])))
        let initializer: PatternInitializer = PatternInitializer(pattern: name, initializerExpression: literal)
        let decl = ConstantDeclaration(initializerList: [initializer])
        let top = TopLevelDeclaration(statements: [decl], comments: [], shebang: nil)
        let s = top.textDescription
        let d = s.data(using: .utf8)
        return d!
    }

    public func literal(dictionary: Dictionary<AnyHashable, Any>) -> Expression {
        var entries: [DictionaryEntry] = []
        for (key, value) in dictionary {
            guard key is Encodable, value is Encodable else {
                continue
            }
            
            let keyEn = key as! Encodable
            let valueEn = value as! Encodable
            
            guard let keyEx = try? literal(any: keyEn), let valueEx = try? literal(any: valueEn) else {
                continue
            }
            entries.append(DictionaryEntry(key: keyEx, value: valueEx))
        }
        let lit = LiteralExpression(kind: LiteralExpression.Kind.dictionary(entries))
        return lit
    }
    
    public func literal(kind: LiteralExpression.Kind) -> Expression {
        let value: Expression = LiteralExpression(kind: kind)
        return value
    }
    
    public func bruteForceType(any: Any) -> String {
        switch any {
        case is String:
            return "String"
        case is Int:
            return "Int"
        case is Int8:
            return "Int8"
        case is Int16:
            return "Int16"
        case is Int32:
            return "Int64"
        case is Int64:
            return "Int64"
        case is UInt:
            return "UInt"
        case is UInt8:
            return "UInt8"
        case is UInt16:
            return "UInt16"
        case is UInt32:
            return "UInt32"
        case is UInt64:
            return "UInt64"
        case is Float:
            return "Float"
        case is Double:
            return "Double"
        case is Bool:
            return "Bool"
        case nil:
            return "Any"
        case is Date:
            return "Date"
        case is Data:
            return "Data"
        case is UUID:
            return "UUID"
        case is Decimal:
            return "Decimal"
        case is URL:
            return "URL"
        case is Decimal:
            return "Decimal"
        default:
            let m = Mirror.init(reflecting: any)
            return String(describing: m.subjectType)
        }
    }
    
    public func literal(any: Any) throws -> Expression {
        guard let encValue = any as? Encodable else {
            throw EncodingError.notEncodable
        }
        
        switch any {
        case let value as String:
            return literal(kind: LiteralExpression.Kind.staticString(value, "\""+value+"\""))
        case let value as Int:
            return literal(kind: LiteralExpression.Kind.integer(value, String(value)))
        case let value as Int8:
            return literal(kind: LiteralExpression.Kind.integer(Int(value), String(value)))
        case let value as Int16:
            return literal(kind: LiteralExpression.Kind.integer(Int(value), String(value)))
        case let value as Int32:
            return literal(kind: LiteralExpression.Kind.integer(Int(value), String(value)))
        case let value as Int64:
            return literal(kind: LiteralExpression.Kind.integer(Int(value), String(value)))
        case let value as UInt:
            return literal(kind: LiteralExpression.Kind.integer(Int(value), String(value)))
        case let value as UInt8:
            return literal(kind: LiteralExpression.Kind.integer(Int(value), String(value)))
        case let value as UInt16:
            return literal(kind: LiteralExpression.Kind.integer(Int(value), String(value)))
        case let value as UInt32:
            return literal(kind: LiteralExpression.Kind.integer(Int(value), String(value)))
        case let value as UInt64:
            return literal(kind: LiteralExpression.Kind.integer(Int(value), String(value)))
        case let value as Float:
            return literal(kind: LiteralExpression.Kind.floatingPoint(Double(value), String(value)))
        case let value as Double:
            return literal(kind: LiteralExpression.Kind.floatingPoint(value, String(value)))
        case let value as Bool:
            return literal(kind: LiteralExpression.Kind.boolean(value))
        case nil:
            return literal(kind: LiteralExpression.Kind.`nil`)
        case is Date:
            throw EncodingError.unsupportedType("Date")
        case is Data:
            return literal(any as! Data)
        case is UUID:
            return literal(any as! UUID)
        case is Decimal:
            return literal(any as! Decimal)
        case is URL:
            throw EncodingError.unsupportedType("URL")
        case is Decimal:
            throw EncodingError.unsupportedType("Decimal")
        case let daa as Dictionary<AnyHashable, Any>:
            let ex = literal(dictionary: daa)
            
            return ex
        default:
            let song = self.encoder as! SongEncoder
            let t = type(of: any as Any)
            let s = String("\(t)".split(separator: " ")[0])
            song.nextKeyedType=s
            try encValue.encode(to: self.encoder)
            return song.nextKeyedContainer!.expression!
        }
    }
}

public enum EncodingError: Error {
    case notEncodable
    case unsupportedType(String)
}
