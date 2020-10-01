//
//  ViewController.swift
//  alura1
//
//  Created by Cezar Castro Rosa on 28/07/20.
//  Copyright © 2020 Cezar Castro Rosa. All rights reserved.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func adicionaRefeicao(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
    
    // MARK: - Atributos
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = []
    var itensSelecionados: [Item] = []
    
    // MARK: - AdicionaItensDelegate
    func add(_ item: Item) {
        
        itens.append(item)
        ItemDao().save(itens)
        
        if let tableView = itensTableView {
            tableView.reloadData()
        } else {
            // exibe alerta de erro
            Alerta(controller: self).exibe(mensagem: "não foi possível atualizar a tabela")
        }
        
    }
    
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula              = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text  = itens[indexPath.row].nome
        
        return celula
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        // obtém célula selecionada
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        
        // item (de)selecionado
        let item = itens[indexPath.row]
        
        // gerencia seleção/deseleção dos itens
        if celula.accessoryType == .none {      // selecionou item
            celula.accessoryType = .checkmark
            
            // adiciona item selecionado
            itensSelecionados.append(item)
        } else {                                // deselecionou item
            celula.accessoryType = .none
            
            // se encontrar item, remove dos itens selecionados
            if let position = itensSelecionados.firstIndex(of: item) {
                itensSelecionados.remove(at: position)
            }
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    @IBOutlet weak var itensTableView: UITableView?
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        let botaoAdicionaItem = UIBarButtonItem(title: "adicionar", style: .plain, target: self, action: #selector(self.adicionarItem))
        
        navigationItem.rightBarButtonItem = botaoAdicionaItem
        
        recuperaItens()
    }
    
    func recuperaItens() {
        itens = ItemDao().recupera()
    }
    
    // Permitir esconder o teclado clicando fora dos inputs e tableview
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc func adicionarItem() {
        
        // referência para viewController de adição de itens
        let adicionarItem = AdicionarItensViewController(delegate: self)
        
        // exibe view programaticamente
        navigationController?.pushViewController(adicionarItem, animated: true)
    }
    
    // obtém dados do formulário
    // cria e retorna Refeicao
    func recuperaRefeicaoDoFormulario() -> Refeicao? {
        
        // versão if-let
        
        // garantindo que constantes serão String
//        if let nomeDaRefeicao = nomeTextField?.text, let felicidadeDaRefeicao = felicidadeTextField?.text {
//
//            // garantindo conversão String->Int
//            if let felicidadeDaRefeicaoInt = Int(felicidadeDaRefeicao) {
//
//                let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidadeDaRefeicaoInt)
//
//                print("comi \(refeicao.nome) e fiquei com felicidade \(refeicao.felicidade)")
//
//            }
//
//        }
        
        // versão guard-let
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return nil
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text else {
            return nil
        }
        
        guard let felicidadeDaRefeicaoInt = Int(felicidadeDaRefeicao) else {
            return nil
        }
        
        // cria refeição
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidadeDaRefeicaoInt, itens: itensSelecionados)
        
        return refeicao
    }
    

    // MARK: - IBActions
    
    // adiciona nova Refeição
    // volta para tela anterior
    @IBAction func adiciona(_ sender: Any) {
        
        if let refeicao = recuperaRefeicaoDoFormulario() {
            // adiciona refeição
            delegate?.adicionaRefeicao(refeicao)
            
            // faz o "pop" da view
            navigationController?.popViewController(animated: true)
        } else {
            Alerta(controller: self).exibe(mensagem: "Dados de refeição inválidos.")
        }
        
    }
    

}

