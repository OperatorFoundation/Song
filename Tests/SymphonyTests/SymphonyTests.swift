//
//  SymphonyTests.swift
//  
//
//  Created by Dr. Brandon Wiley on 5/20/20.
//

import XCTest
@testable import Song
import Foundation
import Datable
@testable import Symphony

class SymphonyTests: XCTestCase {
    func testClear() {
        let symphony = Symphony.instance
        
        let result = symphony.clear()
        XCTAssertTrue(result)
    }
    
    func testCreateString() {
        let symphony = Symphony.instance
        
        let value = "test"
        
        let path = URL(fileURLWithPath: "test")
        
        let clearResult = symphony.clear()
        XCTAssertTrue(clearResult)
        
        let createResult1 = symphony.createValue(value: value, at: path)
        XCTAssertTrue(createResult1)
        
        let createResult2 = symphony.createValue(value: value, at: path)
        XCTAssertFalse(createResult2)
    }
    
    func testReadString() {
        let symphony = Symphony.instance
        
        let value = "test"
        
        let path = URL(fileURLWithPath: "test")
        
        let clearResult = symphony.clear()
        XCTAssertTrue(clearResult)
        
        let readResult1 = symphony.readValue(type: String.self, at: path)
        XCTAssertNil(readResult1)
        
        let createResult = symphony.createValue(value: value, at: path)
        XCTAssertTrue(createResult)
        
        let readResult2 = symphony.readValue(type: String.self, at: path)
        XCTAssertNotNil(readResult2)
        XCTAssertEqual(value, readResult2!)
    }
    
    func testWriteString() {
        let symphony = Symphony.instance
        
        let value1 = "test1"
        let value2 = "test2"
        
        let path = URL(fileURLWithPath: "test")
        
        let clearResult = symphony.clear()
        XCTAssertTrue(clearResult)
        
        let readResult1 = symphony.readValue(type: String.self, at: path)
        XCTAssertNil(readResult1)
        
        let createResult = symphony.createValue(value: value1, at: path)
        XCTAssertTrue(createResult)
        
        let readResult2 = symphony.readValue(type: String.self, at: path)
        XCTAssertNotNil(readResult2)
        XCTAssertEqual(value1, readResult2!)
        
        let writeResult = symphony.writeValue(value: value2, at: path)
        XCTAssertTrue(writeResult)
        
        let readResult3 = symphony.readValue(type: String.self, at: path)
        XCTAssertNotNil(readResult3)
        XCTAssertEqual(value2, readResult3!)
    }
    
    func testDeleteString() {
        let symphony = Symphony.instance
        
        let value = "test"
        
        let path = URL(fileURLWithPath: "test")
        
        let clearResult = symphony.clear()
        XCTAssertTrue(clearResult)
        
        let readResult1 = symphony.readValue(type: String.self, at: path)
        XCTAssertNil(readResult1)
        
        let createResult = symphony.createValue(value: value, at: path)
        XCTAssertTrue(createResult)
        
        let readResult2 = symphony.readValue(type: String.self, at: path)
        XCTAssertNotNil(readResult2)
        
        XCTAssertEqual(value, readResult2!)
        
        let deleteResult = symphony.deleteValue(at: path)
        XCTAssertTrue(deleteResult)
        
        let readResult3 = symphony.readValue(type: String.self, at: path)
        XCTAssertNil(readResult3)
    }
    
    func testCreateStringSequence() {
        let symphony = Symphony.instance
        
        let value = "test"
        let values = [value]
        
        let path = URL(fileURLWithPath: "sequence")
        
        let clearResult = symphony.clear()
        XCTAssertTrue(clearResult)
        
        let sequence1 = symphony.createSequence(values: values, at: path)
        XCTAssertNotNil(sequence1)
        
        let sequence2 = symphony.createSequence(values: values, at: path)
        XCTAssertNil(sequence2)
    }
    
    func testDeleteStringSequence() {
        let symphony = Symphony.instance
        
        let value = "test"
        let values = [value]
        
        let path = URL(fileURLWithPath: "sequence")
        
        let clearResult = symphony.clear()
        XCTAssertTrue(clearResult)
        
        let sequence1 = symphony.createSequence(values: values, at: path)
        XCTAssertNotNil(sequence1)
        
        let sequence2 = symphony.createSequence(values: values, at: path)
        XCTAssertNil(sequence2)
        
        let deleteResult = symphony.deleteSequence(at: path)
        XCTAssertTrue(deleteResult)
        
        let sequence3 = symphony.createSequence(values: values, at: path)
        XCTAssertNotNil(sequence3)
    }
    
    func testReadStringSequenceEmpty() {
        let symphony = Symphony.instance
        
        let value = "test"
        let values = [value]
        
        let path = URL(fileURLWithPath: "sequence")
        
        let clearResult = symphony.clear()
        XCTAssertTrue(clearResult)
        
        guard let sequence1 = symphony.createSequence(values: values, at: path) else
        {
            XCTFail()
            return
        }
        
        let sequence2 = symphony.createSequence(values: values, at: path)
        XCTAssertNil(sequence2)
        
        guard let sequence3 = symphony.readSequence(type: String.self, at: path) else
        {
            XCTFail()
            return
        }
        
        let deleteResult = symphony.deleteSequence(at: path)
        XCTAssertTrue(deleteResult)
        
        let sequence4 = symphony.readSequence(type: [String].self, at: path)
        XCTAssertNil(sequence4)
    }
    
    func testReadStringSequenceNonempty() {
        let symphony = Symphony.instance
        
        let value = "test"
        let values = [value]
        
        let path = URL(fileURLWithPath: "sequence")
        
        let clearResult = symphony.clear()
        XCTAssertTrue(clearResult)
        
        guard let sequence1 = symphony.createSequence(values: values, at: path) else
        {
            XCTFail()
            return
        }
        
        let sequence2 = symphony.createSequence(values: values, at: path)
        XCTAssertNil(sequence2)
        
        guard var sequence3 = symphony.readSequence(type: String.self, at: path) else
        {
            XCTFail()
            return
        }
        
        sequence3.append(value)

        XCTAssertTrue(compare(a: values, b: sequence3))
        
        let deleteResult = symphony.deleteSequence(at: path)
        XCTAssertTrue(deleteResult)
        
        let sequence4 = symphony.readSequence(type: [String].self, at: path)
        XCTAssertNil(sequence4)
    }
}

func compare<T>(a: [T], b: ValueSequence<T>) -> Bool where T: Equatable
{
    if a.count != b.count
    {
        return false
    }
    
    for (index, value) in a.enumerated()
    {
        if value != b[index]
        {
            return false
        }
    }
    
    return true
}