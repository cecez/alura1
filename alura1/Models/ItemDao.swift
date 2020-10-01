//
//  ItemDao.swift
//  alura1
//
//  Created by Cezar Castro Rosa on 01/10/20.
//  Copyright © 2020 Cezar Castro Rosa. All rights reserved.
//

import Foundation

class ItemDao {
    
    
    func save(_ listaDeItens: [Item]) {
        
        // armazena itens em arquivo
        do {
            
            let dados = try NSKeyedArchiver.archivedData(withRootObject: listaDeItens, requiringSecureCoding: false)
            guard let caminho = recuperaDiretorio() else { return }
            try dados.write(to: caminho)
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func recupera() -> [Item] {
        
        // carrega itens do arquivo
        do {
            guard let diretorio = recuperaDiretorio() else { return [] }
            let dados = try Data(contentsOf: diretorio)
            let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! [Item]
            
            return itensSalvos
        } catch {
            print(error.localizedDescription)
            
            return []
        }
        
    }
    
    // MARK: - Outros
    func recuperaDiretorio() -> URL? {
        // obtém caminho do documento
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent("itens")
        
        return caminho
    }
}
