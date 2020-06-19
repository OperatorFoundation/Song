////
////  IPv4Address+Expressible.swift
////  
////
////  Created by Mafalda on 5/26/20.
////
////
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
//        // Sanity Check
//        guard let explicitExpression = expression as? ExplicitMemberExpression
//        else
//        {
//            return nil
//        }
//        
//        switch explicitExpression.kind
//        {
//        case .namedType(let postfix, let identifier):
//            guard let explicitPostfix = postfix as? ExplicitMemberExpression
//            else { return nil }
//            
//            switch explicitPostfix.kind
//            {
//            case .namedType(let nwInterfaceExpression, let interfaceTypeIdentifier):
//                guard let nwInterfaceIdentifierExpression = nwInterfaceExpression as? IdentifierExpression
//                else { return nil }
//                
//                switch nwInterfaceIdentifierExpression.kind {
//                case .identifier(let nwInterfaceIdentifier, _):
//                    switch nwInterfaceIdentifier
//                    {
//                    case .name(let nwInterfaceString):
//                        guard nwInterfaceString == "IPv4Address" else { return nil }
//                        
//                        switch interfaceTypeIdentifier
//                        {
//                        case .name(let interfaceTypeIdName):
//                            guard interfaceTypeIdName == "InterfaceType" else { return nil }
//                            switch identifier
//                            {
//                            case .name(let identifierString):
//                                switch identifierString
//                                {
//                                default:
//                                    return nil
//                                }
//                            default:
//                                return nil
//                            }
//                            
//                        default:
//                            return nil
//                        }
//                        
//                    default:
//                        return nil
//                    }
//                default:
//                    return nil
//                }
//            default:
//                return nil
//            }
//        default:
//            return nil
//        }
//    }
//}
//
