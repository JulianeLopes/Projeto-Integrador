//
//  LoginViewController.swift
//  ProjetoIntegrador
//
//  Created by Juliane Lopes Moreira Rodrigues on 02/06/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usuarioTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    let service = ServicoDeUsuario()
    let viewModel = LoginViewModel()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }
    

    @IBAction func loginAction(_ sender: Any) {
        viewModel.mudarDeTela(usuario: viewModel.confereUsuario(usuarioDig: usuarioTextField.text, senhaDigitada: senhaTextField.text))
    }
    
    @IBAction func cadastrarNovoUsuarioButton(_ sender: Any) {
        performSegue(withIdentifier: "novoCadastro", sender: nil)
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func apresentaAlerta(){
        let alerta = UIAlertController(title: "Usuário ou senha inválido", message: "Tente novamente", preferredStyle: UIAlertController.Style.alert)
                let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alerta.addAction(ok)
                self.present(alerta, animated: true, completion: nil)
    }
    
    func segue() {
        performSegue(withIdentifier: "appSegueIndentifier", sender: nil)
    }
    
    
}
