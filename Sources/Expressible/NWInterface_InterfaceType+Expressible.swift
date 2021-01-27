//
//  File.swift
//  
//
//  Created by Mafalda on 5/26/20.
//

import Foundation
import AST

#if os(Linux)
import NetworkLinux
#else
import Network
#endif

let cellularString = "cellular"
let loopbackString = "loopback"
let otherString = "other"
let wifiString = "wifi"
let wiredEthernetString = "wiredEthernet"
let unknown = "unknown"

extension NWInterface.InterfaceType: Expressible
{
    public var expression: Expression {
        let identifierString: String
        
        switch self
        {
            case .cellular:
                identifierString = cellularString
            case .loopback:
                identifierString = loopbackString
            case .other:
                identifierString = otherString
            case .wifi:
                identifierString = wifiString
            case .wiredEthernet:
                identifierString = wiredEthernetString
            default:
                identifierString = unknown
        }
        
        let identifier = Identifier.name(identifierString)
        let postfix = ExplicitMemberExpression(kind: .namedType(IdentifierExpression(kind: .identifier(Identifier.name("NWInterface"), nil)) , Identifier.name("InterfaceType")))
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
                        guard nwInterfaceString == "NWInterface" else { return nil }
                        
                        switch interfaceTypeIdentifier
                        {
                        case .name(let interfaceTypeIdName):
                            guard interfaceTypeIdName == "InterfaceType" else { return nil }
                            switch identifier
                            {
                            case .name(let identifierString):
                                switch identifierString
                                {
                                case cellularString:
                                    self = .cellular
                                case loopbackString:
                                    self = .loopback
                                case otherString:
                                    self = .other
                                case wifiString:
                                    self = .wifi
                                case wiredEthernetString:
                                    self = .wiredEthernet
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
        default:
            return nil
        }
    }
}
