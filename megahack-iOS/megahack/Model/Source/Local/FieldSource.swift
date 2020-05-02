//
//  FieldSource.swift
//  megahack
//
//  Created by Andressa Valengo on 01/05/20.
//  Copyright © 2020 Andressa Valengo. All rights reserved.
//

class FieldLocalSource: LocalSource {

    private var fields: [Field] = []
    
    init () {
        
        let fieldNames = [
            "Marketing", "Experiência de Usuário", "Negócios",
            "Desenvolvimento", "Empreendedorismo",
            "Design de Produto", "Lógica de Programação",
            "Vendas"
        ]
        
        for name in fieldNames {
            add(item: Field(id: fields.count + 1, description: name))
        }
    }
    
    func getAll() -> [Field] {
        return fields
    }
    
    func add(item: Field) {
        fields.append(item)
    }
}
