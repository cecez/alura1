//
//  RemoveRefeicaoViewController.swift
//  alura1
//
//  Created by Cezar Castro Rosa on 24/09/20.
//  Copyright © 2020 Cezar Castro Rosa. All rights reserved.
//

import UIKit

class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    
    init(_ controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void) {
        
        // exibe refeição em um alerta (com um botão)
        let alerta          = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        let botaoCancelar   = UIAlertAction(title: "cancelar", style: .cancel)
        alerta.addAction(botaoCancelar)
        
        // criando botão para remover Refeicao
        let botaoRemover = UIAlertAction(title: "remover", style: .destructive, handler: handler)
        alerta.addAction(botaoRemover)
        
        controller.present(alerta, animated: true, completion: nil)
        
    }
}
