//
//  Repository.swift
//  megahack
//
//  Created by Andressa Valengo on 01/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

protocol Repository {
    
    associatedtype T
    
    func getAll() -> [T]
    func get( identifier:Int ) -> T?
    func add( item:T ) -> Bool
//    func update( item:T ) -> Bool
//    func delete( item:T ) -> Bool
}
