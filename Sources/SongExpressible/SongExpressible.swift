//
//  SongExpressible.swift
//  
//
//  Created by Dr. Brandon Wiley on 9/10/20.
//

import Foundation
import Song
import Expressible
import AST

public extension SongSingleValueEncodingContainer
{
    func encode<T>(_ value: T) throws where T: Expressible {
        let concreteType = type(of: value as Any)
        let typeName = String("\(concreteType)".split(separator: " ")[0])
        
        let name = IdentifierPattern(identifier: Identifier.name("value"), typeAnnotation: TypeAnnotation(type: TypeIdentifier(names: [TypeIdentifier.TypeName(name: Identifier.name(typeName))])))
        let lit = value.expression
        let initializer: PatternInitializer = PatternInitializer(pattern: name, initializerExpression: lit)
        let decl = ConstantDeclaration(initializerList: [initializer])
        let top = TopLevelDeclaration(statements: [decl], comments: [], shebang: nil)
        let result = top.textDescription
        self.data = result.data(using: .utf8)
    }
}
