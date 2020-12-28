//
//  SongDecoder.swift
//  Song
//
//  Created by Brandon Wiley on 12/28/17.
//

import Foundation

public class SongDecoder {
    public var codingPath: [CodingKey]
    public var userInfo: [CodingUserInfoKey : Any]
    public var data: Data?
    
    public init() {
        codingPath=[]
        userInfo=[:]
    }

    public func decode<T>(_ type: [T].Type, from data: Data) throws -> [T] where T : Decodable {
        NSLog("ARRAY DECODE CHOSEN")
        NSLog("decode<T> data: \(data as NSData)")
        self.data=data
        let container = self._unkeyedContainer()
        do {
            if type == [String].self {
                var results: [String] = []
                while !container.isAtEnd {
                    do {
                        let result: String = try container.decode(String.self)
                        results.append(result)
                    } catch {
                        break
                    }
                }
                return results as! [T]
            } else if type == [Bool].self {
                var results: [Bool] = []
                while !container.isAtEnd {
                    do {
                        let result: Bool = try container.decode(Bool.self)
                        results.append(result)
                    } catch {
                        break
                    }
                }
                return results as! [T]
            } else if type == [Double].self {
                var results: [Double] = []
                while !container.isAtEnd {
                    do {
                        let result: Double = try container.decode(Double.self)
                        results.append(result)
                    } catch {
                        break
                    }
                }
                return results as! [T]
            } else if type == [Float].self {
                var results: [Float] = []
                while !container.isAtEnd {
                    do {
                        let result: Float = try container.decode(Float.self)
                        results.append(result)
                    } catch {
                        break
                    }
                }
                return results as! [T]
            } else if type == [Int].self {
                var results: [Int] = []
                while !container.isAtEnd {
                    do {
                        let result: Int = try container.decode(Int.self)
                        results.append(result)
                    } catch {
                        break
                    }
                }
                return results as! [T]
            } else if type == [Int64].self {
                var results: [Int64] = []
                while !container.isAtEnd {
                    do {
                        let result: Int64 = try container.decode(Int64.self)
                        results.append(result)
                    } catch {
                        break
                    }
                }
                return results as! [T]
            } else if type == [Int32].self {
                var results: [Int32] = []
                while !container.isAtEnd {
                    do {
                        let result: Int32 = try container.decode(Int32.self)
                        results.append(result)
                    } catch {
                        break
                    }
                }
                return results as! [T]
            } else if type == [Int16].self {
                var results: [Int16] = []
                while !container.isAtEnd {
                    do {
                        let result: Int16 = try container.decode(Int16.self)
                        results.append(result)
                    } catch {
                        break
                    }
                }
                return results as! [T]
            } else if type == [Int8].self {
                var results: [Int8] = []
                while !container.isAtEnd {
                    do {
                        let result: Int8 = try container.decode(Int8.self)
                        results.append(result)
                    } catch {
                        break
                    }
                }
                return results as! [T]
            } else if type == [UInt].self {
                var results: [UInt] = []
                while !container.isAtEnd {
                    do {
                        let result: UInt = try container.decode(UInt.self)
                        results.append(result)
                    } catch {
                        break
                    }
                }
                return results as! [T]
            } else if type == [UInt64].self {
                var results: [UInt64] = []
                while !container.isAtEnd {
                    do {
                        let result: UInt64 = try container.decode(UInt64.self)
                        results.append(result)
                    } catch {
                        break
                    }
                }
                return results as! [T]
            } else if type == [UInt32].self {
                var results: [UInt32] = []
                while !container.isAtEnd {
                    do {
                        let result: UInt32 = try container.decode(UInt32.self)
                        results.append(result)
                    } catch {
                        break
                    }
                }
                return results as! [T]
            } else if type == [UInt16].self {
                var results: [UInt16] = []
                while !container.isAtEnd {
                    do {
                        let result: UInt16 = try container.decode(UInt16.self)
                        results.append(result)
                    } catch {
                        break
                    }
                }
                return results as! [T]
            } else if type == [UInt8].self {
                var results: [UInt8] = []
                while !container.isAtEnd {
                    do {
                        let result: UInt8 = try container.decode(UInt8.self)
                        results.append(result)
                    } catch {
                        break
                    }
                }
                return results as! [T]
            } else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 1"))
            }
        } catch {
            throw error
        }
    }
    
    public func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
    {
        NSLog("decode<T> data: \(data as NSData)")
        self.data=data
        if singleType(type) {
            let single = self._singleValueContainer()
            do {
                if type == String.self {
                    let result: String = try single.decode(String.self)
                    return result as! T
                } else if type == Bool.self {
                    let result: Bool = try single.decode(Bool.self)
                    return result as! T
                } else if type == Double.self {
                    let result: Double = try single.decode(Double.self)
                    return result as! T
                } else if type == Float.self {
                    let result: Float = try single.decode(Float.self)
                    return result as! T
                } else if type == Int.self {
                    let result: Int = try single.decode(Int.self)
                    return result as! T
                } else if type == Int64.self {
                    let result: Int64 = try single.decode(Int64.self)
                    return result as! T
                } else if type == Int32.self {
                    let result: Int32 = try single.decode(Int32.self)
                    return result as! T
                } else if type == Int16.self {
                    let result: Int16 = try single.decode(Int16.self)
                    return result as! T
                } else if type == Int8.self {
                    let result: Int8 = try single.decode(Int8.self)
                    return result as! T
                } else if type == UInt.self {
                    let result: UInt = try single.decode(UInt.self)
                    return result as! T
                } else if type == UInt64.self {
                    let result: UInt64 = try single.decode(UInt64.self)
                    return result as! T
                } else if type == UInt32.self {
                    let result: UInt32 = try single.decode(UInt32.self)
                    return result as! T
                } else if type == UInt16.self {
                    let result: UInt16 = try single.decode(UInt16.self)
                    return result as! T
                } else if type == UInt8.self {
                    let result: UInt8 = try single.decode(UInt8.self)
                    return result as! T
                } else {
                    throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "unsupported type 2"))
                }
            } catch {
                throw error
            }
        } else {
            let single = self._singleValueContainer()
            do {
                let result: T = try single.decode(type)
                return result
            } catch {
                throw error
            }
        }
    }
    
    public func singleType<T>(_ type: T.Type) -> Bool {
        if type == String.self {
            return true
        }
        if type == Bool.self {
            return true
        }
        if type == Float.self {
            return true
        }
        if type == Double.self {
            return true
        }
        if type == Int.self {
            return true
        }
        if type == Int64.self {
            return true
        }
        if type == Int32.self {
            return true
        }
        if type == Int16.self {
            return true
        }
        if type == Int8.self {
            return true
        }
        if type == UInt.self {
            return true
        }
        if type == UInt64.self {
            return true
        }
        if type == UInt32.self {
            return true
        }
        if type == UInt16.self {
            return true
        }
        if type == UInt8.self {
            return true
        }
        
        return false
    }
    
    public func _container<Key>(keyedBy type: Key.Type) -> SongKeyedDecodingContainer<Key> where Key : CodingKey {
        return SongKeyedDecodingContainer<Key>(decoder: self, codingPath: codingPath, data: data!)
    }
    
    public func _singleValueContainer() -> SongSingleValueDecodingContainer {
        NSLog("data for svc \(data! as NSData)")
        return SongSingleValueDecodingContainer(decoder: self, codingPath: codingPath, data: data!)
    }
    
    public func _unkeyedContainer() -> SongUnkeyedDecodingContainer {
        return SongUnkeyedDecodingContainer(decoder: self, codingPath: codingPath, data: data!)
    }
}

extension SongDecoder: Decoder {
    public func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        let container = SongKeyedDecodingContainer<Key>(decoder: self, codingPath: codingPath, data: data!)
        return KeyedDecodingContainer<Key>(container)
    }
    
    public func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        return SongUnkeyedDecodingContainer(decoder: self, codingPath: codingPath, data: data!)
    }
    
    public func singleValueContainer() throws -> SingleValueDecodingContainer {
        return SongSingleValueDecodingContainer(decoder: self, codingPath: codingPath, data: data!)
    }
}
