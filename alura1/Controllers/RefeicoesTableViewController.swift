//
//  RefeicoesTableViewController.swift
//  alura1
//
//  Created by Cezar Castro Rosa on 27/08/20.
//  Copyright © 2020 Cezar Castro Rosa. All rights reserved.
//

import UIKit

class RefeicoesTableViewController : UITableViewController, AdicionaRefeicaoDelegate {
    
    // array de refeições para exibir na view
    var refeicoes: [Refeicao] = []
    
    
    // MARK: - UITableViewController
    
    // método para informar quantidade de itens na table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    // método para informar o conteúdo de um item da table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // criar célula e seu conteúdo visual
        let celula              = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text  = refeicoes[indexPath.row].nome
        
        // cria gesto de longpress e vincula na célula
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.mostrarDetalhes))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        // carrega documento com refeições
        refeicoes = RefeicaoDao().obtem()
        
    }
    
    
    
    
    // adiciona nova refeição no array de Refeicao
    // atualiza view
    func adicionaRefeicao(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
        
        // armazena refeicoes
        RefeicaoDao().salva(refeicoes)
    }
    
    // ação após longpress na célula
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer) {
        
        // detecta início do gesto
        if (gesture.state == .began) {
            // obtem célula
            let celula = gesture.view as! UITableViewCell
            
            // obtém índice da célula pressionada
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            
            // obtém refeicao
            let refeicao = refeicoes[indexPath.row]
            
            RemoveRefeicaoViewController(self).exibe(refeicao, handler:
                { alerta in
                    self.refeicoes.remove(at: indexPath.row)
                    self.tableView.reloadData()
                })
            
            
        }
        
    }
    
    // prepara transição, armazenando referência desta view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "adicionar") {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }
    
}
