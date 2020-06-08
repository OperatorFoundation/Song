//
//  IPv4Address+Expressible.swift
//  
//
//  Created by Mafalda on 5/26/20.
//
//
//import Foundation
//import Network
//import AST
//
//extension IPv4Address: Expressible
//{
//    public var expression: Expression
//    {
//        let expression = LiteralExpression(kind: .staticString(ipString, ipStringQuoted))
//        let argument = FunctionCallExpression.Argument.expression(expression)
//        let identifier = Identifier.name("IPv4Address")
//        let postfixExpression = IdentifierExpression(kind: .identifier(identifier, nil))
//        let initializerExpression = InitializerExpression(postfixExpression: postfixExpression, argumentNames: [Identifier.name(ipStringQuoted)])
//        return initializerExpression
//    }
//    
//    public init?(expression: Expression)
//    {
//        guard let rawData = expression. as? Data
//            else { return nil }
//        self.init(rawData)
//    }
//}

