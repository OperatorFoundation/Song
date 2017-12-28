import XCTest
@testable import Song
import Foundation

class SongTests: XCTestCase {
    func testEncodeString() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        let result = try? song.encode("string")
        let correct = "let value: String = \"string\"".data(using: .utf8)!
        
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeInt() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        let value: Int = 100
        let result = try? song.encode(value)
        let correct = "let value: Int = 100".data(using: .utf8)!
        
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeInt64() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        let value: Int64 = 100
        let result = try? song.encode(value)
        let correct = "let value: Int64 = 100".data(using: .utf8)!
        
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }
    
    func testEncodeInt32() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        let value: Int32 = 100
        let result = try? song.encode(value)
        let correct = "let value: Int32 = 100".data(using: .utf8)!
        
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }
    
    func testEncodeInt16() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        let value: Int16 = 100
        let result = try? song.encode(value)
        let correct = "let value: Int16 = 100".data(using: .utf8)!
        
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }
    
    func testEncodeInt8() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        let value: Int8 = 100
        let result = try? song.encode(value)
        let correct = "let value: Int8 = 100".data(using: .utf8)!
        
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeUInt() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        let value: UInt = 100
        let result = try? song.encode(value)
        let correct = "let value: UInt = 100".data(using: .utf8)!
        
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }
    
    func testEncodeUInt64() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        let value: UInt64 = 100
        let result = try? song.encode(value)
        let correct = "let value: UInt64 = 100".data(using: .utf8)!
        
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }
    
    func testEncodeUInt32() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        let value: UInt32 = 100
        let result = try? song.encode(value)
        let correct = "let value: UInt32 = 100".data(using: .utf8)!
        
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeUInt16() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        let value: UInt16 = 100
        let result = try? song.encode(value)
        let correct = "let value: UInt16 = 100".data(using: .utf8)!
        
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }
    
    func testEncodeUInt8() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        let value: UInt8 = 100
        let result = try? song.encode(value)
        let correct = "let value: UInt8 = 100".data(using: .utf8)!
        
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeFloat() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        let value: Float = 100
        let result = try? song.encode(value)
        let correct = "let value: Float = 100.0".data(using: .utf8)!
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }
    
    func testEncodeDouble() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        let value: Double = 100
        let result = try? song.encode(value)
        let correct = "let value: Double = 100.0".data(using: .utf8)!
        
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeBool() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        
        let result1 = try? song.encode(true)
        let correct1 = "let value: Bool = true".data(using: .utf8)!
        
        XCTAssertNotNil(result1)
        XCTAssertEqual(result1!, correct1)
        
        let result2 = try? song.encode(false)
        let correct2 = "let value: Bool = false".data(using: .utf8)!
        
        XCTAssertNotNil(result2)
        XCTAssertEqual(result2!, correct2)
    }

    func testEncodeData() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        
        let data = Data(base64Encoded: "c3RyaW5n")
        let result = try? song.encode(data)
        let correct = "let value: Data = Data(base64Encoded: \"c3RyaW5n\")".data(using: .utf8)!
        
        NSLog("\(result! as! NSData)")
        NSLog("\(correct as! NSData)")
        
        NSLog("\(String(bytes: result!, encoding: .utf8))")
        NSLog("\(String(bytes: correct, encoding: .utf8))")

        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeUUID() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        
        let uuid = UUID(uuidString: "123E4567-E89B-12D3-A456-426655440000")!
        let result = try? song.encode(uuid)
        let correct = "let value: UUID = UUID(uuidString: \"123E4567-E89B-12D3-A456-426655440000\")".data(using: .utf8)!
        
        NSLog("result \(result! as! NSData)")
        NSLog("correct \(correct as! NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeDecimal() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        
        let dec = Decimal(string: "100")!
        let result = try? song.encode(dec)
        let correct = "let value: Decimal = Decimal(string: \"100\")".data(using: .utf8)!
        
        NSLog("result \(result! as! NSData)")
        NSLog("correct \(correct as! NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeIntArray() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        
        let ints: [Int] = [100, 200, 300]
        let result = try? song.encode(ints)
        let correct = "let value: Array<Int> = [100, 200, 300]".data(using: .utf8)!
        
        NSLog("result \(result! as! NSData)")
        NSLog("correct \(correct as! NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeInt64Array() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        
        let ints: [Int64] = [100, 200, 300]
        let result = try? song.encode(ints)
        let correct = "let value: Array<Int64> = [100, 200, 300]".data(using: .utf8)!
        
        NSLog("result \(result! as! NSData)")
        NSLog("correct \(correct as! NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeInt32Array() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        
        let ints: [Int32] = [100, 200, 300]
        let result = try? song.encode(ints)
        let correct = "let value: Array<Int32> = [100, 200, 300]".data(using: .utf8)!
        
        NSLog("result \(result! as! NSData)")
        NSLog("correct \(correct as! NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeInt16Array() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        
        let ints: [Int16] = [100, 200, 300]
        let result = try? song.encode(ints)
        let correct = "let value: Array<Int16> = [100, 200, 300]".data(using: .utf8)!
        
        NSLog("result \(result! as! NSData)")
        NSLog("correct \(correct as! NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeInt8Array() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        
        let ints: [Int8] = [100, 120, 126]
        let result = try? song.encode(ints)
        let correct = "let value: Array<Int8> = [100, 120, 126]".data(using: .utf8)!
        
        NSLog("result \(result! as! NSData)")
        NSLog("correct \(correct as! NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }
    
    func testEncodeStruct() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        
        struct ExampleStruct: Codable {
            let value: String
        }
        
        let ex = ExampleStruct(value: "example string")
        let result = try? song.encode(ex)
        let correct = "let value: ExampleStruct = ExampleStruct(value: \"example string\")".data(using: .utf8)!
        
        NSLog("result \(result! as! NSData)")
        NSLog("correct \(correct as! NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeStruct2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = Song()
        
        struct ExampleStruct: Codable {
            let value: String
            let index: Int
        }
        
        let ex = ExampleStruct(value: "example string", index: 123)
        let result = try? song.encode(ex)
        let correct = "let value: ExampleStruct = ExampleStruct(value: \"example string\", index: 123)".data(using: .utf8)!
        
        NSLog("result \(result! as! NSData)")
        NSLog("correct \(correct as! NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }
    
    func testEncodeClass() {
        let song = Song()
        
        class ExampleClass: Codable {
            let value: String
            
            init(value: String) {
                self.value=value
            }
        }
        
        let ex = ExampleClass(value: "example string")
        let result = try? song.encode(ex)
        let correct = "let value: ExampleClass = ExampleClass(value: \"example string\")".data(using: .utf8)!
        
        NSLog("result \(result! as! NSData)")
        NSLog("correct \(correct as! NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeClass2() {
        let song = Song()
        
        class ExampleClass: Codable {
            let value: String
            let index: Int

            init(value: String, index: Int) {
                self.value=value
                self.index=index
            }
        }
        
        let ex = ExampleClass(value: "example string", index: 123)
        let result = try? song.encode(ex)
        let correct = "let value: ExampleClass = ExampleClass(value: \"example string\", index: 123)".data(using: .utf8)!
        
        NSLog("result \(result! as! NSData)")
        NSLog("correct \(correct as! NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeDictionary() {
        let song = Song()

        let ex: Dictionary<String, String> = ["a": "b"]
        let result = try? song.encode(ex)
        let correct = "let value: Dictionary<String, String> = [\"a\": \"b\"]".data(using: .utf8)!
        
        NSLog("result \(result! as! NSData)")
        NSLog("correct \(correct as! NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }
    
//    static var allTests = [
//        ("testExample", testExample),
//    ]
}
