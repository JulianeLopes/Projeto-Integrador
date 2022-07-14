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
    
    @IBAction func loginGoogleButtom(_ sender: Any) {
        viewModel.loginGoogle()
    }
    
    
    @IBAction func loginFacebookButtom(_ sender: Any) {
    }
    
    
// quando o usuario clicar no botão de login ele é direcionado para a tela home
    @IBAction func loginAction(_ sender: Any) {
        viewModel.mudarDeTela(usuario: viewModel.confereUsuario(usuarioDig: usuarioTextField.text, senhaDigitada: senhaTextField.text))
    }
// caso seja o primeiro acesso do usuário, ao clicar no botão "Não tem conta? Cadastre-se aqui" será direcionado a tela de cadastro
    @IBAction func cadastrarNovoUsuarioButton(_ sender: Any) {
        performSegue(withIdentifier: "novoCadastro", sender: nil)
    }
}

// delegates para capiturar as ações do usuário na tela
extension LoginViewController: LoginViewModelDelegate {
    // apresenta alerta se o usuario não for encontrado na base
    func apresentaAlerta(){
        let alerta = UIAlertController(title: "Usuário ou senha inválido", message: "Tente novamente", preferredStyle: UIAlertController.Style.alert)
                let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alerta.addAction(ok)
                self.present(alerta, animated: true, completion: nil)
    }
    // se o usuario for encontrado é direcionado para a tela home
    func segue() {
        performSegue(withIdentifier: "appSegueIndentifier", sender: nil)
    }
}
