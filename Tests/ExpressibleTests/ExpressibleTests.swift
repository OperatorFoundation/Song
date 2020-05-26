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
    
    func testIPV4()
    {
        
    }
}
