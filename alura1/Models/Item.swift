//
//  Item.swift
//  alura1
//
//  Created by Cezar Castro Rosa on 19/08/20.
//  Copyright © 2020 Cezar Castro Rosa. All rights reserved.
//

import UIKit

class Item: NSObject {

    // MARK - Atributos
    var nome: String
    var calorias: Double
    
    // MARK - Construtor
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
    
}
