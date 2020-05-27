//
//  Expressible.swift
//  
//
//  Created by Mafalda on 5/26/20.
//

import Foundation
import AST

public protocol Expressible
{
    var expression: Expression { get }
    
    init?(expression: Expression)
}
