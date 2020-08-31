//
//  RefeicoesTableViewController.swift
//  alura1
//
//  Created by Cezar Castro Rosa on 27/08/20.
//  Copyright © 2020 Cezar Castro Rosa. All rights reserved.
//

import UIKit

class RefeicoesTableViewController : UITableViewController {
    
    // array de refeições para exibir na view
    var refeicoes = [
                        Refeicao(nome: "Lasanha", felicidade: 4),
                        Refeicao(nome: "Pizza", felicidade: 5),
                        Refeicao(nome: "Brócolis", felicidade: 3),
                    ]
    
    // método para informar quantidade de itens na table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    // método para informar o conteúdo de um item da table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula              = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text  = refeicoes[indexPath.row].nome
        
        return celula
    }
    
    // adiciona nova refeição no array de Refeicao
    // atualiza view
    func adicionaRefeicao(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    // prepara transição, armazenando referência desta view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.tableViewController = self
        }
    }
    
}
