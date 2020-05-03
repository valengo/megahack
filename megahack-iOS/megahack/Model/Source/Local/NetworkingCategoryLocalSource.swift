//
//  NetworkingLocalSource.swift
//  megahack
//
//  Created by Andressa Valengo on 03/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

import Foundation

class NetworkingCategoryLocalSource: LocalSource {
    
    private var categories: [NetworkingCategory] = []
    
    init() {
        add(item: NetworkingCategory(id: 1, description: "Design", imageName: "Pencil"))
        add(item: NetworkingCategory(id: 2, description: "Desenvolvimento", imageName: "Mouse"))
        add(item: NetworkingCategory(id: 3, description: "Negócios", imageName: "Light"))
        add(item: NetworkingCategory(id: 4, description: "Marketing", imageName: "Illustration"))
    }
    
    func getAll() -> [NetworkingCategory] {
        return categories
    }
    
    func add(item: NetworkingCategory) {
        categories.append(item)
    }
}
