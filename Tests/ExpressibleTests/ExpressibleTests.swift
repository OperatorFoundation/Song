//
//  ExpressibleTests.swift
//  
//
//  Created by Mafalda on 5/26/20.
//

import XCTest
import Foundation
import Net
import Datable
import AST
import Parser
import Source
import Song
import SongExpressible

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
    
    func testEncodeExpressible() {
        let song = SongEncoder()._singleValueContainer()
        
        let source = NWInterface.InterfaceType.wifi
        let correct = "let value: InterfaceType = NWInterface.InterfaceType.wifi"
        
        do
        {
            try song.encode(source)
        }
        catch
        {
            XCTFail()
            return
        }
        
        let result = song.data
        XCTAssertNotNil(result)
        
        guard let r = result else {
            XCTFail()
            return
        }
        
        let s = r.string
        
        XCTAssertEqual(s, correct)
    }
    
    func testDecodeExpressible() {
        let source = "let value: InterfaceType = NWInterface.InterfaceType.wifi"
        let correct = NWInterface.InterfaceType.wifi
        
        do
        {
            let song = SongDecoder()
            song.data = source.data
            let single = song._singleValueContainer()
            let result = try single.decode(NWInterface.InterfaceType.self)
            XCTAssertEqual(result, correct)
        }
        catch
        {
            XCTFail()
            return
        }
    }
}
