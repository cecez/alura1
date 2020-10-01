//
//  Alerta.swift
//  alura1
//
//  Created by Cezar Castro Rosa on 21/09/20.
//  Copyright © 2020 Cezar Castro Rosa. All rights reserved.
//

import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(titulo: String = "Atenção", mensagem: String) {
        
        // exibe alerta de erro
        let alerta  = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let ok      = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alerta.addAction(ok)
        
        controller.present(alerta, animated: true, completion: nil)
    }
    
}
