//
//  NovoUsuarioViewController.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/06/07.
//

import UIKit

class NovoUsuarioViewController: UIViewController {
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    let viewModel = NovoUsuarioViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }
    
    // cadastrar usuario
    @IBAction func cadastrarButton(_ sender: Any) {
       viewModel.adicionaUsuario(nome: nomeTextField.text, email: emailTextField.text, senha: senhaTextField.text)
    }
}

// capta todas as acoes do usuario na tela
extension NovoUsuarioViewController: NovoUsuarioViewModelDelegate {
    //  cadastro efetuado corretamente e redireciona para a tela de login
    func cadastroEfetuado() {
        dismiss(animated: true) {
            self.performSegue(withIdentifier: "voltarIdentifier", sender: self.viewModel.novoUsuarioCriado)
        }
    }
    
    // alerta de dados incorretos
    func alertaDadosDeCadastroIncorretos() {
        let alerta = UIAlertController(title: "Dados Incorretos", message: "Insira um email válido e uma senha de 6 caracteres", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        alerta.addAction(ok)
        present(alerta, animated: true)
    }
}
