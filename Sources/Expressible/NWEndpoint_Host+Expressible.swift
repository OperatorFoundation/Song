//
//  NWEndpoint_Host+Expressible.swift
//  
//
//  Created by Mafalda on 5/28/20.
//

import Foundation
import Network
import AST

extension NWEndpoint.Host: Expressible
{
    public var expression: Expression
    {
        let identifierString = "placeholder"
//
//        switch self
//        {
//            case .ipv4(let ipv4Address):
//                <#code#>
//            default:
//                <#code#>
//        }
        
        let identifier = Identifier.name(identifierString)
        let postfix = ExplicitMemberExpression(kind: .namedType(IdentifierExpression(kind: .identifier(Identifier.name("NWEndpoint"), nil)) , Identifier.name("Host")))
        let explicitExpression = ExplicitMemberExpression(kind: .namedType(postfix, identifier))
        
        return explicitExpression
    }
    
    public init?(expression: Expression)
    {
        // Sanity Check
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
//                            case .name(let identifierString):
//                                switch identifierString
//                                {
//                                case cellularString:
//                                    self = .cellular
//                                case loopbackString:
//                                    self = .loopback
//                                case otherString:
//                                    self = .other
//                                case wifiString:
//                                    self = .wifi
//                                case wiredEthernetString:
//                                    self = .wiredEthernet
//                                default:
//                                    return nil
//                                }
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
