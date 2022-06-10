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
    
    //
    @IBAction func cadastrarButton(_ sender: Any) {
        ServicoDeUsuario.listaDeUsuario.append(viewModel.novoUsuario(nome: nomeTextField.text, email: emailTextField.text, senha: senhaTextField.text))
        dismiss(animated: true) {
            self.performSegue(withIdentifier: "voltarIdentifier", sender: self.viewModel.novoUsuarioCriado)
        }
    }
}

extension NovoUsuarioViewController: NovoUsuarioViewModelDelegate {
    func alertaDadosDeCadastroIncorretos() {
        
        let alerta = UIAlertController(title: "Dados Incorretos", message: "Insira um email válido e uma senha de 6 caracteres", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        alerta.addAction(ok)
        
        self.present(alerta, animated: true, completion: nil)
    }
}



