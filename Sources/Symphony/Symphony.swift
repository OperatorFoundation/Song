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
