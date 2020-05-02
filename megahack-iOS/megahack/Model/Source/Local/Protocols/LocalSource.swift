//
//  SourceProtocol.swift
//  megahack
//
//  Created by Andressa Valengo on 01/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

protocol LocalSource {
    associatedtype T
    
    func getAll() -> [T]
    
    func add(item: T)
}
