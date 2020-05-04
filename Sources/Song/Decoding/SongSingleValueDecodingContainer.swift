//
//  SongSingleValueDecodingContainer.swift
//  Song
//
//  Created by Brandon Wiley on 12/28/17.
//

import Foundation

import AST
import Parser
import Source

public class SongSingleValueDecodingContainer: SingleValueDecodingContainer {
    public var decoder: Decoder
    public var codingPath: [CodingKey]
    public var result: Any?
    public var data: Data?
    
    public init(decoder: Decoder, codingPath: [CodingKey], data: Data?) {
        self.decoder=decoder
        self.codingPath=codingPath
        self.data=data
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
    
    public func decodeNil() -> Bool {
        do {
            let lit = try unwrap()
            
            return literalNil(lit)
        } catch {
            return false
        }
    }
    
    func literalNil(_ lit: LiteralExpression) -> Bool {
        let kind = lit.kind
        switch kind {
        case LiteralExpression.Kind.`nil`:
            return true
        default:
            return false
        }
    }
    
    public func decode(_ type: Bool.Type) throws -> Bool {
        do {
            let lit = try unwrap()

            return try literal(type, lit)
        } catch {
            throw error
        }
    }

    func literal(_ type: Bool.Type, _ lit: LiteralExpression) throws -> Bool {
        let kind = lit.kind
        switch kind {
        case LiteralExpression.Kind.boolean(let value):
            return value
        default:
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Literal expression was not of kind bool"))
        }
    }

    public func decode(_ type: Int.Type) throws -> Int {
        do {
            let lit = try unwrap()
            
            return try literal(type, lit)
        } catch {
            throw error
        }
    }

    func literal(_ type: Int.Type, _ lit: LiteralExpression) throws -> Int {
        do {
            let kind = lit.kind
            switch kind {
            case LiteralExpression.Kind.integer(let value, _):
                return value
            default:
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Literal expression was not of kind int"))
            }
        } catch {
            throw error
        }
    }
    
    public func decode(_ type: Int64.Type) throws -> Int64 {
        do {
            let lit = try unwrap()
            
            return try literal(type, lit)
        } catch {
            throw error
        }
    }
    
    func literal(_ type: Int64.Type, _ lit: LiteralExpression) throws -> Int64 {
        do {
            let kind = lit.kind
            switch kind {
            case LiteralExpression.Kind.integer(let value, _):
                return Int64(value)
            default:
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Literal expression was not of kind int"))
            }
        } catch {
            throw error
        }
    }

    public func decode(_ type: Int32.Type) throws -> Int32 {
        do {
            let lit = try unwrap()
            
            return try literal(type, lit)
        } catch {
            throw error
        }
    }
    
    func literal(_ type: Int32.Type, _ lit: LiteralExpression) throws -> Int32 {
        do {
            let kind = lit.kind
            switch kind {
            case LiteralExpression.Kind.integer(let value, _):
                return Int32(value)
            default:
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Literal expression was not of kind int"))
            }
        } catch {
            throw error
        }
    }

    public func decode(_ type: Int16.Type) throws -> Int16 {
        do {
            let lit = try unwrap()
            
            return try literal(type, lit)
        } catch {
            throw error
        }
    }
    
    func literal(_ type: Int16.Type, _ lit: LiteralExpression) throws -> Int16 {
        do {
            let kind = lit.kind
            switch kind {
            case LiteralExpression.Kind.integer(let value, _):
                return Int16(value)
            default:
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Literal expression was not of kind int"))
            }
        } catch {
            throw error
        }
    }

    public func decode(_ type: Int8.Type) throws -> Int8 {
        do {
            let lit = try unwrap()
            
            return try literal(type, lit)
        } catch {
            throw error
        }
    }
    
    func literal(_ type: Int8.Type, _ lit: LiteralExpression) throws -> Int8 {
        do {
            let kind = lit.kind
            switch kind {
            case LiteralExpression.Kind.integer(let value, _):
                return Int8(value)
            default:
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Literal expression was not of kind int"))
            }
        } catch {
            throw error
        }
    }

    public func decode(_ type: UInt.Type) throws -> UInt {
        do {
            let lit = try unwrap()
            
            return try literal(type, lit)
        } catch {
            throw error
        }
    }
    
    func literal(_ type: UInt.Type, _ lit: LiteralExpression) throws -> UInt {
        do {
            let kind = lit.kind
            switch kind {
            case LiteralExpression.Kind.integer(let value, _):
                return UInt(value)
            default:
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Literal expression was not of kind int"))
            }
        } catch {
            throw error
        }
    }

    
    public func decode(_ type: UInt64.Type) throws -> UInt64 {
        do {
            let lit = try unwrap()
            
            return try literal(type, lit)
        } catch {
            throw error
        }
    }
    
    func literal(_ type: UInt64.Type, _ lit: LiteralExpression) throws -> UInt64 {
        do {
            let kind = lit.kind
            switch kind {
            case LiteralExpression.Kind.integer(let value, _):
                return UInt64(value)
            default:
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Literal expression was not of kind int"))
            }
        } catch {
            throw error
        }
    }

    public func decode(_ type: UInt32.Type) throws -> UInt32 {
        do {
            let lit = try unwrap()
            
            return try literal(type, lit)
        } catch {
            throw error
        }
    }
    
    func literal(_ type: UInt32.Type, _ lit: LiteralExpression) throws -> UInt32 {
        do {
            let kind = lit.kind
            switch kind {
            case LiteralExpression.Kind.integer(let value, _):
                return UInt32(value)
            default:
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Literal expression was not of kind int"))
            }
        } catch {
            throw error
        }
    }

    public func decode(_ type: UInt16.Type) throws -> UInt16 {
        do {
            let lit = try unwrap()
            
            return try literal(type, lit)
        } catch {
            throw error
        }
    }
    
    func literal(_ type: UInt16.Type, _ lit: LiteralExpression) throws -> UInt16 {
        do {
            let kind = lit.kind
            switch kind {
            case LiteralExpression.Kind.integer(let value, _):
                return UInt16(value)
            default:
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Literal expression was not of kind int"))
            }
        } catch {
            throw error
        }
    }

    public func decode(_ type: UInt8.Type) throws -> UInt8 {
        do {
            let lit = try unwrap()
            
            return try literal(type, lit)
        } catch {
            throw error
        }
    }
    
    func literal(_ type: UInt8.Type, _ lit: LiteralExpression) throws -> UInt8 {
        do {
            let kind = lit.kind
            switch kind {
            case LiteralExpression.Kind.integer(let value, _):
                return UInt8(value)
            default:
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Literal expression was not of kind int"))
            }
        } catch {
            throw error
        }
    }

    public func decode(_ type: Float.Type) throws -> Float {
        do {
            let lit = try unwrap()
            
            return try literal(type, lit)
        } catch {
            throw error
        }
    }
    
    func literal(_ type: Float.Type, _ lit: LiteralExpression) throws -> Float {
        do {
            let kind = lit.kind
            switch kind {
            case LiteralExpression.Kind.floatingPoint(let value, _):
                return Float(value)
            default:
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Literal expression was not of kind int"))
            }
        } catch {
            throw error
        }
    }
    
    public func decode(_ type: Double.Type) throws -> Double {
        do {
            let lit = try unwrap()
            
            return try literal(type, lit)
        } catch {
            throw error
        }
    }
    
    func literal(_ type: Double.Type, _ lit: LiteralExpression) throws -> Double {
        do {
            let kind = lit.kind
            switch kind {
            case LiteralExpression.Kind.floatingPoint(let value, _):
                return value
            default:
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Literal expression was not of kind int"))
            }
        } catch {
            throw error
        }
    }

    public func decode(_ type: String.Type) throws -> String {
        do {
            let lit = try unwrap()
            
            return try literal(type, lit)
        } catch {
            throw error
        }
    }
    
    func literal(_ type: String.Type, _ lit: LiteralExpression) throws -> String {
        do {
            let kind = lit.kind
            switch kind {
            case LiteralExpression.Kind.staticString(let value, _):
                return value
            default:
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Literal expression was not of kind int"))
            }
        } catch {
            throw error
        }
    }
    
    public func unwrap() throws -> LiteralExpression {
        NSLog("Decoding string!!!")
        guard let d = data else {
            NSLog("No data")
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 23"))
        }
        
        guard let ast = getAST(data: d) else {
            NSLog("No AST")
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 24"))
        }
        
        print(ast)

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
            
                let ini = inis[0]
            
                switch ini {
                    case is PatternInitializer:
                        let pat = ini 
                        let maybeEx = pat.initializerExpression
                        guard let ex = maybeEx else {
                            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Missing initializer expression"))
                        }
                        switch ex {
                            case is LiteralExpression:
                                let lit = ex as! LiteralExpression
                                return lit
                            default:
                                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Initializer expression is not literal expression"))
                        }
                    default:
                        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Initializer was not pattern initializer"))
            }
            default:
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Top level statement was not constant declaration"))
        }
    }
    
    public func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        do {
            let lit = try unwrapStruct()
            
            return try makeStruct(type, lit)
        } catch {
            throw error
        }
        
        NSLog("GENERAL DECODE")
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 25"))
    }
    
    public func unwrapStruct() throws -> FunctionCallExpression {
        NSLog("Decoding string!!!")
        guard let d = data else {
            NSLog("No data")
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 26"))
        }
        
        guard let ast = getAST(data: d) else {
            NSLog("No AST")
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 27"))
        }
        
        print(ast)

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
            
                let ini = inis[0]
            
                switch ini {
                    case is PatternInitializer:
                        let pat = ini
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
                        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Initializer was not pattern initializer"))
            }
            default:
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Top level statement was not constant declaration"))
        }
    }
    
    func makeStruct<T>(_ type: T.Type, _ lit: FunctionCallExpression) throws -> T where T : Decodable {
        do {
            let name = lit.postfixExpression.textDescription
            print(name)
            
            let song = self.decoder as! SongDecoder
            
            return try type.init(from: song)
//            let kind = lit.kind
//            switch kind {
//            case LiteralExpression.Kind.staticString(let value, _):
//                return value
//            default:
//                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Literal expression was not of kind int"))
//            }
        } catch {
            print(error)
            throw error
        }
        
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 28"))
    }
}
