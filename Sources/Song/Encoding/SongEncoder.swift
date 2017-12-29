import Foundation

import AST

public protocol Datable {
    var data: Data? {
        get
    }
    
    var expression: Expression? {
        get
    }
}

public class SongEncoder {
    public var codingPath: [CodingKey]
    public var userInfo: [CodingUserInfoKey : Any]
    public var nextKeyedType: String?
    public var nextKeyedContainer: Datable?
    public var data: Data?
    
    public init() {
        codingPath=[]
        userInfo=[:]
    }

    func encode<Key, Value>(_ value: [Key: Value]) throws -> Data where Key : Encodable & CodingKey, Value : Encodable {
        let map = _container(keyedBy: Key.self)
        for (key, val) in value {
            do {
                try map.encode(val, forKey: key)
            } catch {
                throw error
            }
        }
        
        return map.data!
    }
    
    func encode<Value>(_ value: [Value]) throws -> Data where Value : Encodable {
        if let ints = value as? [Int] {
            let list = self._unkeyedContainer()
            do {
                list.type=TypeIdentifier(names: [TypeIdentifier.TypeName(name: "Int")])
                for int in ints {
                    try list.encode(int)
                }
            } catch {
                throw error
            }

            return list.data!
        } else if let ints = value as? [Int64] {
            let list = self._unkeyedContainer()
            do {
                list.type=TypeIdentifier(names: [TypeIdentifier.TypeName(name: "Int64")])
                for int in ints {
                    try list.encode(int)
                }
            } catch {
                throw error
            }
            
            return list.data!
        } else if let ints = value as? [Int32] {
            let list = self._unkeyedContainer()
            do {
                list.type=TypeIdentifier(names: [TypeIdentifier.TypeName(name: "Int32")])
                for int in ints {
                    try list.encode(int)
                }
            } catch {
                throw error
            }
            
            return list.data!
        } else if let ints = value as? [Int16] {
            let list = self._unkeyedContainer()
            do {
                list.type=TypeIdentifier(names: [TypeIdentifier.TypeName(name: "Int16")])
                for int in ints {
                    try list.encode(int)
                }
            } catch {
                throw error
            }
            
            return list.data!
        } else if let ints = value as? [Int8] {
            let list = self._unkeyedContainer()
            do {
                list.type=TypeIdentifier(names: [TypeIdentifier.TypeName(name: "Int8")])
                for int in ints {
                    try list.encode(int)
                }
            } catch {
                throw error
            }
            
            return list.data!
        } else {
            let list = self._unkeyedContainer()
            do {
                list.type=TypeIdentifier(names: [TypeIdentifier.TypeName(name: String(describing: Value.self))])
                for val in value {
                    try list.encode(val)
                }
            } catch {
                throw error
            }
            
            return list.data!
        }
    }
    
    func encode<Value>(_ value: Value) throws -> Data where Value : Encodable {
        switch value {
//        case is Dictionary<K: Hashable, Any>:
//            break
//        case is Array:
//            break
        case is Int:
            let single = self._singleValueContainer()
            do {
                try single.encode(value as! Int)
            } catch {
                throw error
            }
            
            return single.data!
        case is Int64:
            let single = self._singleValueContainer()
            do {
                try single.encode(value as! Int64)
            } catch {
                throw error
            }
            
            return single.data!
        case is Int32:
            let single = self._singleValueContainer()
            do {
                try single.encode(value as! Int32)
            } catch {
                throw error
            }
            
            return single.data!
        case is Int16:
            let single = self._singleValueContainer()
            do {
                try single.encode(value as! Int16)
            } catch {
                throw error
            }
            
            return single.data!
        case is Int8:
            let single = self._singleValueContainer()
            do {
                try single.encode(value as! Int8)
            } catch {
                throw error
            }
            
            return single.data!
        case is UInt:
            let single = self._singleValueContainer()
            do {
                try single.encode(value as! UInt)
            } catch {
                throw error
            }
            
            return single.data!
        case is UInt64:
            let single = self._singleValueContainer()
            do {
                try single.encode(value as! UInt64)
            } catch {
                throw error
            }
            
            return single.data!
        case is UInt32:
            let single = self._singleValueContainer()
            do {
                try single.encode(value as! UInt32)
            } catch {
                throw error
            }
            
            return single.data!
        case is UInt16:
            let single = self._singleValueContainer()
            do {
                try single.encode(value as! UInt16)
            } catch {
                throw error
            }
            
            return single.data!
        case is UInt8:
            let single = self._singleValueContainer()
            do {
                try single.encode(value as! UInt8)
            } catch {
                throw error
            }
            
            return single.data!
        case is Float:
            let single = self._singleValueContainer()
            do {
                try single.encode(value as! Float)
            } catch {
                throw error
            }
            
            return single.data!
        case is Double:
            let single = self._singleValueContainer()
            do {
                try single.encode(value as! Double)
            } catch {
                throw error
            }
            
            return single.data!
        case is String:
            let single = self._singleValueContainer()
            do {
                try single.encode(value as! String)
            } catch {
                throw error
            }
            
            return single.data!
        case is Bool:
            let single = self._singleValueContainer()
            do {
                try single.encode(value as! Bool)
            } catch {
                throw error
            }
            
            return single.data!
        case is Data:
            let single = self._singleValueContainer()
            do {
                try single.encode(value as! Data)
            } catch {
                throw error
            }
            
            return single.data!
        case is UUID:
            let single = self._singleValueContainer()
            do {
                try single.encode(value as! UUID)
            } catch {
                throw error
            }
            
            return single.data!
        default:
            let single = self._singleValueContainer()
            do {
                try single.encode(value)
            } catch {
                throw error
            }
            
            return single.data!
        }
    }
    
    public func _container<Key>(keyedBy type: Key.Type) -> SongKeyedEncodingContainer<Key> where Key : CodingKey {
        let container = SongKeyedEncodingContainer<Key>(encoder: self, codingPath: codingPath, containerType: nextKeyedType)
        nextKeyedContainer = container as Datable
        return container
    }
    
    public func _singleValueContainer() -> SongSingleValueEncodingContainer {
        return SongSingleValueEncodingContainer(encoder: self, codingPath: codingPath)
    }
        
    public func _unkeyedContainer() -> SongUnkeyedEncodingContainer {
        return SongUnkeyedEncodingContainer(encoder: self, codingPath: codingPath)
    }
}

extension SongEncoder: Encoder {
    public func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key : CodingKey {
        let container = SongKeyedEncodingContainer<Key>(encoder: self, codingPath: codingPath, containerType: nextKeyedType)
        nextKeyedContainer = container as Datable
        return KeyedEncodingContainer(container)
    }
    
    public func unkeyedContainer() -> UnkeyedEncodingContainer {
        return SongUnkeyedEncodingContainer(encoder: self, codingPath: codingPath)
    }
    
    public func singleValueContainer() -> SingleValueEncodingContainer {
        return SongSingleValueEncodingContainer(encoder: self, codingPath: codingPath)
    }
}

