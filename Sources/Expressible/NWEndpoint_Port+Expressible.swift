//
//  NWEndpoint_Port+Expressible.swift
//  
//
//  Created by Mafalda on 6/9/20.
//

import Foundation
import AST

#if os(Linux)
import NetworkLinux
#else
import Network
#endif

extension NWEndpoint.Port: Expressible
{
    public var expression: Expression
    {
        let identifierString = "placeholder"
        let identifier = Identifier.name(identifierString)
        let postfix = ExplicitMemberExpression(kind: .namedType(IdentifierExpression(kind: .identifier(Identifier.name("NWEndpoint"), nil)) , Identifier.name("Port")))
        let explicitExpression = ExplicitMemberExpression(kind: .namedType(postfix, identifier))
        
        return explicitExpression
    }
    
    public init?(expression: Expression)
    {
        guard let explicitExpression = expression as? ExplicitMemberExpression
        else
        {
            return nil
        }
        
        switch explicitExpression.kind
        {
        case .namedType(let postfix, let identifier):
            guard let explicitPostfix = postfix as? ExplicitMemberExpression
            else { return nil }
            
            switch explicitPostfix.kind
            {
            case .namedType(let nwInterfaceExpression, let interfaceTypeIdentifier):
                guard let nwInterfaceIdentifierExpression = nwInterfaceExpression as? IdentifierExpression
                else { return nil }
                
                switch nwInterfaceIdentifierExpression.kind {
                case .identifier(let nwInterfaceIdentifier, _):
                    switch nwInterfaceIdentifier
                    {
                    case .name(let nwInterfaceString):
                        guard nwInterfaceString == "NWEndpoint" else { return nil }
                        
                        switch interfaceTypeIdentifier
                        {
                        case .name(let interfaceTypeIdName):
                            guard interfaceTypeIdName == "Host" else { return nil }
                            switch identifier
                            {
                            default:
                                return nil
                            }
                            
                        default:
                            return nil
                        }
                        
                    default:
                        return nil
                    }
                default:
                    return nil
                }
            default:
                return nil
            }
        default:
            return nil
        }
    }
    
    
}
