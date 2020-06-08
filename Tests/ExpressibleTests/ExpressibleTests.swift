//
//  ExpressibleTests.swift
//  
//
//  Created by Mafalda on 5/26/20.
//

import XCTest
import Foundation
import Network
import Datable
import AST
import Parser
import Source

@testable import Expressible

class ExpressibleTests: XCTestCase {
    
    func testNWInterfaceInterfaceType()
    {
        let value = NWInterface.InterfaceType.other
            let expression = value.expression
            let result = NWInterface.InterfaceType(expression: expression)
            XCTAssertEqual(result, value)
    }
    
    func testIPv4()
    {
        let ipString = "127.0.0.1"
        let ipStringQuoted = "\"127.0.0.1\""
        let value = IPv4Address(ipString)
        let ipv4String = "let value = IPv4Address(\"127.0.0.1\")"
//        let expression = value!.expression
//
//        print(expression)
//
//        let result = NWInterface.InterfaceType(expression: expression)

        let source = SourceFile(content: ipv4String)
        let parser = Parser(source: source)
        
        guard let topLevelDecl = try? parser.parse() else {
            XCTFail()
            return
        }
        
        print("\ntopLevelDecl: \(topLevelDecl.statements)\n")
        
        
//        let argumentClause = FunctionCallExpression.ArgumentList(arrayLiteral: argument)
        
        let expression = LiteralExpression(kind: .staticString(ipString, ipStringQuoted))
        let argument = FunctionCallExpression.Argument.expression(expression)
        let identifier = Identifier.name("IPv4Address")
        let postfixExpression = IdentifierExpression(kind: .identifier(identifier, nil))
        let initializerExpression = InitializerExpression(postfixExpression: postfixExpression, argumentNames: [Identifier.name(ipStringQuoted)])
        
//        let pattern = IdentifierPattern(identifier: Identifier.name("value"))
//        let patternInitializer = PatternInitializer(pattern: pattern, initializerExpression: initializerExpression)
        
        
        
        print("Initializer Expression: \(initializerExpression)")
    }
    
    func testTest()
    {
        let value = NWInterface.InterfaceType.other
        let interfaceString = "let value = NWInterface.InterfaceType.other"
        let expression = value.expression
        
        print(expression)
        
        let result = NWInterface.InterfaceType(expression: expression)

        let source = SourceFile(content: interfaceString)
        let parser = Parser(source: source)
        
        guard let topLevelDecl = try? parser.parse() else {
            XCTFail()
            return
        }
        
        print("\ntopLevelDecl: \(topLevelDecl.statements)\n")
        let identifier = Identifier.name("wifi")
        let postfix = ExplicitMemberExpression(kind: .namedType(IdentifierExpression(kind: .identifier(Identifier.name("NWInterface"), nil)) , Identifier.name("InterfaceType")))
        let explicitExpression = ExplicitMemberExpression(kind: .namedType(postfix, identifier))
        print("explicitExpression: \(explicitExpression)")
    }
}
