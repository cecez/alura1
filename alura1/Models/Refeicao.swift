//
//  Refeicao.swift
//  alura1
//
//  Created by Cezar Castro Rosa on 19/08/20.
//  Copyright © 2020 Cezar Castro Rosa. All rights reserved.
//

import UIKit

class Refeicao: NSObject, NSCoding {
    
    // MARK - NSCoding
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(felicidade, forKey: "felicidade")
        coder.encode(itens, forKey: "itens")
    }
    
    required init?(coder: NSCoder) {
        nome        = coder.decodeObject(forKey: "nome") as! String
        felicidade  = coder.decodeObject(forKey: "felicidade") as! Int
        itens       = coder.decodeObject(forKey: "itens") as! Array<Item>
    }
    

    // MARK - Atributos
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
    
    // MARK - Construtor
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome       = nome
        self.felicidade = felicidade
        self.itens      = itens
    }
    
    // MARK - Métodos
    func detalhes() -> String {
        var mensagem = "Felicidade: \(felicidade)"
        
        for item in itens {
            mensagem += ", \(item.nome) - calorias: \(item.calorias)"
        }
        
        return mensagem
    }
    
    func totalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        
        return total
    }
    
}
