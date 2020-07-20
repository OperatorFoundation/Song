//
//  Symphony.swift
//  
//
//  Created by Dr. Brandon Wiley on 6/6/20.
//

import Foundation

public class Symphony
{
    let root: URL
    
    public var readOnly: ReadOnlySymphony
    {
        return ReadOnlySymphony(symphony: self)
    }
    
    public init(_ path: String)
    {
        let url = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        self.root = url.appendingPathComponent(path)
    }
    
    public init(root: URL)
    {
        self.root = root
    }
}

public struct ReadOnlySymphony
{
    let symphony: Symphony
    
    public init(_ path: String)
    {
        self.symphony = Symphony(path)
    }
    
    public init(root: URL)
    {
        self.symphony = Symphony(root: root)
    }
    
    public init(symphony: Symphony)
    {
        self.symphony = symphony
    }
    
    public func readOnlySubkeysSequence<T>(elementType: T.Type, at url: URL) -> ReadOnlySubkeySequence<T>? where T: Codable
    {
        return self.symphony.readOnlySubkeysSequence(elementType: T.self, at: url)
    }
}
