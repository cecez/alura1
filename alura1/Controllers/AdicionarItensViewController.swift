//
//  AdicionarItensViewController.swift
//  alura1
//
//  Created by Cezar Castro Rosa on 08/09/20.
//  Copyright © 2020 Cezar Castro Rosa. All rights reserved.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
    // MARK: - Atributos
    var delegate: AdicionaItensDelegate?
    
    // MARK: - Métodos
    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction
    @IBAction func adicionarItem(_ sender: Any) {
        
        // verificações dos campos de texto
        guard let nome = nomeTextField.text,
              let calorias = caloriasTextField.text,
              let caloriasDouble = Double(calorias) else {
            return
        }
        
//        guard let caloriasDouble = Double(calorias) else {
//            return
//        }
        
        // cria item
        let item = Item(nome: nome, calorias: caloriasDouble)
        
        // adiciona item
        delegate?.add(item)
        
        // voltar para tela anterior
        navigationController?.popViewController(animated: true)
        
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
