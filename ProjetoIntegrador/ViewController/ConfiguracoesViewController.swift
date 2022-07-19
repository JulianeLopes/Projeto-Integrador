//
//  ConfiguracoesViewController.swift
//  ProjetoIntegrador
//
//  Created by Gui  on 31/05/22.
//

import UIKit

class ConfiguracoesViewController: UIViewController {

    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var listaOpcoesTableView: UITableView!
    
    let viewModel = ConfiguracaoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaOpcoesTableView.dataSource = self
        fotoImageView.layer.cornerRadius = 20
        
    }
}

extension ConfiguracoesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.quantidadeDeItens()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "configuracaoCell", for: indexPath) as? ConfiguracaoTableViewCell
        cell?.configuraCelula(titulo: viewModel.getItem(row: indexPath.row))
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }
}

    
extension ConfiguracoesViewController: ConfiguracaoViewModelDelegate {
    func clicouNoBotao(title: String) {
        switch title {
        case "Conta" :
            performSegue(withIdentifier: "fanzometro", sender: nil)
        case "Dados Pessoais":
            performSegue(withIdentifier: "dadosPessoais", sender: nil)
        case "Trocar usuário":
            performSegue(withIdentifier: "voltarParaLogin", sender: nil)
        case "Sair":
            performSegue(withIdentifier: "voltarParaLogin", sender: nil)
        default:
            performSegue(withIdentifier: "dadosPessoais", sender: nil)
        }
    }
}

