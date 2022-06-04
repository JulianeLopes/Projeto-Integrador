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
    
    let viewModel = LoginViewModel()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self

    }
    

    @IBAction func loginAction(_ sender: Any) {
        // valida texto?
        // colocar os dados de email e senha
        
        viewModel.converteTextField(email: usuarioTextField.text, senha: senhaTextField.text)
        
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func getDados() {
//        usuarioTextField.text  = usua
//        let senha = senhaTextField.text ?? ""
    }
    
    
}
