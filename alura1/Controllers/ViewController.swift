//
//  ViewController.swift
//  alura1
//
//  Created by Cezar Castro Rosa on 28/07/20.
//  Copyright © 2020 Cezar Castro Rosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableViewController: RefeicoesTableViewController?
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?

    
    @IBAction func adiciona(_ sender: Any) {
        
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
            print("nome de refeicao invalido")
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text else {
            print("felicidade invalida")
            return
        }
        
        guard let felicidadeDaRefeicaoInt = Int(felicidadeDaRefeicao) else {
            print("falha ao converter felicidade para Int")
            return
        }
        
        // cria refeição
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidadeDaRefeicaoInt)
        
        print("comi \(refeicao.nome) e fiquei com felicidade \(refeicao.felicidade)")
        
        // adiciona refeição
        tableViewController?.adicionaRefeicao(refeicao)
        
        // faz o "pop" da view
        navigationController?.popViewController(animated: true)
        
    }
    

}

