import XCTest
@testable import Song
import Foundation

class SongTests: XCTestCase {
    func testEncodeString() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = SongEncoder()
        let result = try? song.encode("string")
        let correct = "let value: String = \"string\"".data(using: .utf8)!
        
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeInt() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = SongEncoder()
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
        let song = SongEncoder()
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
        let song = SongEncoder()
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
        let song = SongEncoder()
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
        let song = SongEncoder()
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
        let song = SongEncoder()
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
        let song = SongEncoder()
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
        let song = SongEncoder()
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
        let song = SongEncoder()
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
        let song = SongEncoder()
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
        let song = SongEncoder()
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
        let song = SongEncoder()
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
        let song = SongEncoder()
        
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
        let song = SongEncoder()
        
        let data = Data(base64Encoded: "c3RyaW5n")
        let result = try? song.encode(data)
        let correct = "let value: Data = Data(base64Encoded: \"c3RyaW5n\")".data(using: .utf8)!
        
        NSLog("\(result! as NSData)")
        NSLog("\(correct as NSData)")
        
        NSLog("\(String(bytes: result!, encoding: .utf8))")
        NSLog("\(String(bytes: correct, encoding: .utf8))")

        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeUUID() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = SongEncoder()
        
        let uuid = UUID(uuidString: "123E4567-E89B-12D3-A456-426655440000")!
        let result = try? song.encode(uuid)
        let correct = "let value: UUID = UUID(uuidString: \"123E4567-E89B-12D3-A456-426655440000\")".data(using: .utf8)!
        
        NSLog("result \(result! as NSData)")
        NSLog("correct \(correct as NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeDecimal() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = SongEncoder()
        
        let dec = Decimal(string: "100")!
        let result = try? song.encode(dec)
        let correct = "let value: Decimal = Decimal(string: \"100\")".data(using: .utf8)!
        
        NSLog("result \(result! as NSData)")
        NSLog("correct \(correct as NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeIntArray() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = SongEncoder()
        
        let ints: [Int] = [100, 200, 300]
        let result = try? song.encode(ints)
        let correct = "let value: Array<Int> = [100, 200, 300]".data(using: .utf8)!
        
        NSLog("result \(result! as NSData)")
        NSLog("correct \(correct as NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeInt64Array() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = SongEncoder()
        
        let ints: [Int64] = [100, 200, 300]
        let result = try? song.encode(ints)
        let correct = "let value: Array<Int64> = [100, 200, 300]".data(using: .utf8)!
        
        NSLog("result \(result! as NSData)")
        NSLog("correct \(correct as NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeInt32Array() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = SongEncoder()
        
        let ints: [Int32] = [100, 200, 300]
        let result = try? song.encode(ints)
        let correct = "let value: Array<Int32> = [100, 200, 300]".data(using: .utf8)!
        
        NSLog("result \(result! as NSData)")
        NSLog("correct \(correct as NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeInt16Array() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = SongEncoder()
        
        let ints: [Int16] = [100, 200, 300]
        let result = try? song.encode(ints)
        let correct = "let value: Array<Int16> = [100, 200, 300]".data(using: .utf8)!
        
        NSLog("result \(result! as NSData)")
        NSLog("correct \(correct as NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeInt8Array() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = SongEncoder()
        
        let ints: [Int8] = [100, 120, 126]
        let result = try? song.encode(ints)
        let correct = "let value: Array<Int8> = [100, 120, 126]".data(using: .utf8)!
        
        NSLog("result \(result! as NSData)")
        NSLog("correct \(correct as NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }
    
    func testEncodeStruct() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = SongEncoder()
        
        struct ExampleStruct: Codable {
            let value: String
        }
        
        let ex = ExampleStruct(value: "example string")
        let result = try? song.encode(ex)
        let correct = "let value: ExampleStruct = ExampleStruct(value: \"example string\")".data(using: .utf8)!
        
        NSLog("result \(result! as NSData)")
        NSLog("correct \(correct as NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeStruct2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = SongEncoder()
        
        struct ExampleStruct: Codable {
            let value: String
            let index: Int
        }
        
        let ex = ExampleStruct(value: "example string", index: 123)
        let result = try? song.encode(ex)
        let correct = "let value: ExampleStruct = ExampleStruct(value: \"example string\", index: 123)".data(using: .utf8)!
        
        NSLog("result \(result! as NSData)")
        NSLog("correct \(correct as NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }
    
    func testDecodeStructStringField() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = SongDecoder()
        
        struct ExampleStruct: Codable, Equatable {
            let value: String
        }
        
        guard let input = "let value: ExampleStruct = ExampleStruct(value: \"example string\")".data(using: .utf8) else
        {
            XCTFail()
            return
        }
        guard let result = try? song.decode(ExampleStruct.self, from: input) else
        {
            XCTFail()
            return
        }
        let correct = ExampleStruct(value: "example string")
                
        XCTAssertEqual(result, correct)
    }
    
    func testDecodeStructIntField() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = SongDecoder()
        
        struct ExampleStruct: Codable, Equatable {
            let value: Int
        }
        
        guard let input = "let value: ExampleStruct = ExampleStruct(value: 1)".data(using: .utf8) else
        {
            XCTFail()
            return
        }
        guard let result = try? song.decode(ExampleStruct.self, from: input) else
        {
            XCTFail()
            return
        }
        let correct = ExampleStruct(value: 1)
                
        XCTAssertEqual(result, correct)
    }
    
    func testDecodeStructUIntField() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = SongDecoder()
        
        struct ExampleStruct: Codable, Equatable {
            let value: UInt
        }
        
        guard let input = "let value: ExampleStruct = ExampleStruct(value: 1)".data(using: .utf8) else
        {
            XCTFail()
            return
        }
        guard let result = try? song.decode(ExampleStruct.self, from: input) else
        {
            XCTFail()
            return
        }
        let correct = ExampleStruct(value: 1)
                
        XCTAssertEqual(result, correct)
    }
    
    func testDecodeStructIntFields() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let song = SongDecoder()
        
        struct ExampleStruct: Codable, Equatable {
            let int: Int
            let int8: Int8
            let int16: Int16
            let int32: Int32
            let int64: Int64
        }
        
        guard let input = "let value: ExampleStruct = ExampleStruct(int: 1, int8: 2, int16: 3, int32: 4, int64: 5)".data(using: .utf8) else
        {
            XCTFail()
            return
        }
        guard let result = try? song.decode(ExampleStruct.self, from: input) else
        {
            XCTFail()
            return
        }
        let correct = ExampleStruct(int: 1, int8: 2, int16: 3, int32: 4, int64: 5)
                
        XCTAssertEqual(result, correct)
    }
 
   func testDecodeStructUIntFields() {
       // This is an example of a functional test case.
       // Use XCTAssert and related functions to verify your tests produce the correct
       // results.
       let song = SongDecoder()
       
       struct ExampleStruct: Codable, Equatable {
           let uint: UInt
           let uint8: UInt8
           let uint16: UInt16
           let uint32: UInt32
           let uint64: UInt64
       }
       
       guard let input = "let value: ExampleStruct = ExampleStruct(uint: 1, uint8: 2, uint16: 3, uint32: 4, uint64: 5)".data(using: .utf8) else
       {
           XCTFail()
           return
       }
       guard let result = try? song.decode(ExampleStruct.self, from: input) else
       {
           XCTFail()
           return
       }
       let correct = ExampleStruct(uint: 1, uint8: 2, uint16: 3, uint32: 4, uint64: 5)
               
       XCTAssertEqual(result, correct)
   }
    
    func testEncodeClass() {
        let song = SongEncoder()
        
        class ExampleClass: Codable {
            let value: String
            
            init(value: String) {
                self.value=value
            }
        }
        
        let ex = ExampleClass(value: "example string")
        let result = try? song.encode(ex)
        let correct = "let value: ExampleClass = ExampleClass(value: \"example string\")".data(using: .utf8)!
        
        NSLog("result \(result! as NSData)")
        NSLog("correct \(correct as NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeClass2() {
        let song = SongEncoder()
        
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
        
        NSLog("result \(result! as NSData)")
        NSLog("correct \(correct as NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }

    func testEncodeDictionary() {
        let song = SongEncoder()

        let ex: Dictionary<String, String> = ["a": "b"]
        let result = try? song.encode(ex)
        let correct = "let value: Dictionary<String, String> = [\"a\": \"b\"]".data(using: .utf8)!
        
        NSLog("result \(result! as NSData)")
        NSLog("correct \(correct as NSData)")
        
        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, correct)
    }
    
//    func testEncodeEnum() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct
//        // results.
//        let song = SongEncoder()
//
//        enum ExampleEnum
//        {
//            case a
//            case b
//        }
//
//        let ex = ExampleEnum.a
//        let result = try? song.encode(ex)
//        let correct = "let value: ExampleEnum = ExampleEnum.a".data(using: .utf8)!
//
//        NSLog("result \(result! as NSData)")
//        NSLog("correct \(correct as NSData)")
//
//        NSLog("result  \(String(bytes: result!, encoding: .utf8)!)")
//        NSLog("correct \(String(bytes: correct, encoding: .utf8)!)")
//
//        XCTAssertNotNil(result)
//        XCTAssertEqual(result!, correct)
//    }
    
    func testDecodeString() {
        let song = SongDecoder()
        let source = "let value: String = \"string\"".data(using: .utf8)!
        let result = try? song.decode(String.self, from: source)
        let correct: String = "string"
        
        NSLog(String(describing: result))
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }

    func testDecodeBool() {
        let song = SongDecoder()
        let source = "let value: Bool = true\n".data(using: .utf8)!
        let result = try? song.decode(Bool.self, from: source)
        let correct: Bool = true
        
        NSLog(String(describing: result))
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }

    func testDecodeDouble() {
        let song = SongDecoder()
        let source = "let value: Double = 123.5".data(using: .utf8)!
        let result = try? song.decode(Double.self, from: source)
        let correct: Double = 123.5
        
        NSLog(String(describing: result))
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }
    
    func testDecodeFloat() {
        let song = SongDecoder()
        let source = "let value: Float = 123.5".data(using: .utf8)!
        let result = try? song.decode(Float.self, from: source)
        let correct: Float = 123.5
        
        NSLog(String(describing: result))
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }

    func testDecodeInt() {
        let song = SongDecoder()
        let source = "let value: Int = 123".data(using: .utf8)!
        let result = try? song.decode(Int.self, from: source)
        let correct: Int = 123
        
        NSLog(String(describing: result))
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }

    func testDecodeInt64() {
        let song = SongDecoder()
        let source = "let value: Int64 = 123".data(using: .utf8)!
        let result = try? song.decode(Int64.self, from: source)
        let correct: Int64 = 123
        
        NSLog(String(describing: result))
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }

    func testDecodeInt32() {
        let song = SongDecoder()
        let source = "let value: Int32 = 123".data(using: .utf8)!
        let result = try? song.decode(Int32.self, from: source)
        let correct: Int32 = 123
        
        NSLog(String(describing: result))
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }

    func testDecodeInt16() {
        let song = SongDecoder()
        let source = "let value: Int16 = 123".data(using: .utf8)!
        let result = try? song.decode(Int16.self, from: source)
        let correct: Int16 = 123
        
        NSLog(String(describing: result))
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }

    func testDecodeInt8() {
        let song = SongDecoder()
        let source = "let value: Int8 = 123".data(using: .utf8)!
        let result = try? song.decode(Int8.self, from: source)
        let correct: Int8 = 123
        
        NSLog(String(describing: result))
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }

    func testDecodeUInt() {
        let song = SongDecoder()
        let source = "let value: UInt = 123".data(using: .utf8)!
        let result = try? song.decode(UInt.self, from: source)
        let correct: UInt = 123
        
        NSLog(String(describing: result))
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }
    
    func testDecodeUInt64() {
        let song = SongDecoder()
        let source = "let value: UInt64 = 123".data(using: .utf8)!
        let result = try? song.decode(UInt64.self, from: source)
        let correct: UInt64 = 123
        
        NSLog(String(describing: result))
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }
    
    func testDecodeUInt32() {
        let song = SongDecoder()
        let source = "let value: UInt32 = 123".data(using: .utf8)!
        let result = try? song.decode(UInt32.self, from: source)
        let correct: UInt32 = 123
        
        NSLog(String(describing: result))
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }
    
    func testDecodeUInt16() {
        let song = SongDecoder()
        let source = "let value: UInt16 = 123".data(using: .utf8)!
        let result = try? song.decode(UInt16.self, from: source)
        let correct: UInt16 = 123
        
        NSLog(String(describing: result))
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }
    
    func testDecodeUInt8() {
        let song = SongDecoder()
        let source = "let value: UInt8 = 123".data(using: .utf8)!
        let result = try? song.decode(UInt8.self, from: source)
        let correct: UInt8 = 123
        
        NSLog(String(describing: result))
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }
    
    func testDecodeBoolArray() {
        let song = SongDecoder()
        
        let source = "let value: Array<Bool> = [true, false, true]".data(using: .utf8)!
        let correct: [Bool] = [true, false, true]
        
        let result = try? song.decode([Bool].self, from: source)
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }

    func testDecodeStringArray() {
        let song = SongDecoder()
        
        let source = "let value: Array<String> = [\"a\", \"b\", \"c\"]".data(using: .utf8)!
        let correct: [String] = ["a", "b", "c"]
        
        let result = try? song.decode([String].self, from: source)
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }

    func testDecodeFloatArray() {
        let song = SongDecoder()
        
        let source = "let value: Array<Float> = [1.0, 123.5, 0.6667]".data(using: .utf8)!
        let correct: [Float] = [1.0, 123.5, 0.6667]
        
        let result = try? song.decode([Float].self, from: source)
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }

    func testDecodeDoubleArray() {
        let song = SongDecoder()
        
        let source = "let value: Array<Double> = [1.0, 123.5, 0.6667]".data(using: .utf8)!
        let correct: [Double] = [1.0, 123.5, 0.6667]
        
        let result = try? song.decode([Double].self, from: source)
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }

    func testDecodeIntArray() {
        let song = SongDecoder()
        
        let source = "let value: Array<Int> = [1, 123, 0]".data(using: .utf8)!
        let correct: [Int] = [1, 123, 0]
        
        let result = try? song.decode([Int].self, from: source)
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }

    func testDecodeInt64Array() {
        let song = SongDecoder()
        
        let source = "let value: Array<Int64> = [1, 123, 0]".data(using: .utf8)!
        let correct: [Int64] = [1, 123, 0]
        
        let result = try? song.decode([Int64].self, from: source)
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }

    func testDecodeInt32Array() {
        let song = SongDecoder()
        
        let source = "let value: Array<Int32> = [1, 123, 0]".data(using: .utf8)!
        let correct: [Int32] = [1, 123, 0]
        
        let result = try? song.decode([Int32].self, from: source)
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }

    func testDecodeInt16Array() {
        let song = SongDecoder()
        
        let source = "let value: Array<Int16> = [1, 123, 0]".data(using: .utf8)!
        let correct: [Int16] = [1, 123, 0]
        
        let result = try? song.decode([Int16].self, from: source)
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }

    func testDecodeInt8Array() {
        let song = SongDecoder()
        
        let source = "let value: Array<Int8> = [1, 123, 0]".data(using: .utf8)!
        let correct: [Int8] = [1, 123, 0]
        
        let result = try? song.decode([Int8].self, from: source)
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }

    func testDecodeUIntArray() {
        let song = SongDecoder()
        
        let source = "let value: Array<UInt> = [1, 123, 0]".data(using: .utf8)!
        let correct: [UInt] = [1, 123, 0]
        
        let result = try? song.decode([UInt].self, from: source)
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }
    
    func testDecodeUInt64Array() {
        let song = SongDecoder()
        
        let source = "let value: Array<UInt64> = [1, 123, 0]".data(using: .utf8)!
        let correct: [UInt64] = [1, 123, 0]
        
        let result = try? song.decode([UInt64].self, from: source)
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }
    
    func testDecodeUInt32Array() {
        let song = SongDecoder()
        
        let source = "let value: Array<UInt32> = [1, 123, 0]".data(using: .utf8)!
        let correct: [UInt32] = [1, 123, 0]
        
        let result = try? song.decode([UInt32].self, from: source)
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }
    
    func testDecodeUInt16Array() {
        let song = SongDecoder()
        
        let source = "let value: Array<UInt16> = [1, 123, 0]".data(using: .utf8)!
        let correct: [UInt16] = [1, 123, 0]
        
        let result = try? song.decode([UInt16].self, from: source)
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }
    
    func testDecodeUInt8Array() {
        let song = SongDecoder()
        
        let source = "let value: Array<UInt8> = [1, 123, 0]".data(using: .utf8)!
        let correct: [UInt8] = [1, 123, 0]
        
        let result = try? song.decode([UInt8].self, from: source)
        
        XCTAssertNotNil(result)
        guard let r = result else {
            return
        }
        XCTAssertEqual(r, correct)
    }
    
//    func testChoir()
//    {
//        let song = SongDecoder()
//        
//        let source = "let result = 123"
//        let correct = 123
//        
//        let expectation = XCTestExpectation(description: "remote call succeeded")
//        
//        remoteCall(code: source)
//        {
//            result in
//            
//            print("result: \(result.string)")
//            
//            guard let value = try? song.decode(Int.self, from: result) else
//            {
//                XCTFail()
//                return
//            }
//            
//            XCTAssertEqual(value, correct)
//            
//            expectation.fulfill()
//        }
//        
//        wait(for: [expectation], timeout: 60)
//    }
    
//    static var allTests = [
//        ("testExample", testExample),
//    ]
}
