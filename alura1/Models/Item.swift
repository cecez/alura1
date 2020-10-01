//
//  Item.swift
//  alura1
//
//  Created by Cezar Castro Rosa on 19/08/20.
//  Copyright © 2020 Cezar Castro Rosa. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
    
    // MARK - NSCoding
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder: NSCoder) {
        nome        = coder.decodeObject(forKey: "nome") as! String
        calorias    = coder.decodeObject(forKey: "calorias") as! Double
    }
    

    // MARK - Atributos
    var nome: String
    var calorias: Double
    
    // MARK - Construtor
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
    
}
