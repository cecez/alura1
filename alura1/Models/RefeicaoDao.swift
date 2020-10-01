//
//  RefeicaoDao.swift
//  alura1
//
//  Created by Cezar Castro Rosa on 30/09/20.
//  Copyright © 2020 Cezar Castro Rosa. All rights reserved.
//

import Foundation

class RefeicaoDao {
    
    // MARK: - Outros
    func recuperaDiretorio() -> URL? {
        // obtém caminho do documento
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent("refeicao")
        
        return caminho
    }
    
    func salva(_ refeicoes: [Refeicao]) {
        
        // obtém caminho do documento
        guard let caminho = recuperaDiretorio() else { return }
        
        // escreve no documento
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func obtem() -> [Refeicao] {
        
        // obtém caminho do documento
        guard let caminho = recuperaDiretorio() else { return [] }
        
        do {
            
            // recupera documento
            let dados                   = try Data(contentsOf: caminho)
            guard let refeicoesSalvas   = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? [Refeicao] else { return [] }
            
            // atribui dados para array de refeições
            return refeicoesSalvas
            
        } catch  {
            print(error.localizedDescription)
            return []
        }
        
    }
    
    
}
