//
//  Symphony.swift
//  
//
//  Created by Dr. Brandon Wiley on 6/6/20.
//

import Foundation

public class Symphony
{
    static public let instance: Symphony = Symphony("database")
    
    let root: URL
    
    init(_ path: String)
    {
        let url = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        self.root = url.appendingPathComponent(path)
    }
    
    init(root: URL)
    {
        self.root = root
    }
}
