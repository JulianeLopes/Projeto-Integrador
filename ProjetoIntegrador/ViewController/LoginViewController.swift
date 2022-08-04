//
//  LoginViewController.swift
//  ProjetoIntegrador
//
//  Created by Juliane Lopes Moreira Rodrigues on 02/06/22.
//

import UIKit
import GoogleSignIn
import FacebookLogin
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usuarioTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
//    let service = ServicoDeUsuario()
    let viewModel = LoginViewModel()
    let sessionManager = SessionManager.shared
    
    let loginButton = FBLoginButton(
        frame: .zero,
        permissions: [.publicProfile])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        senhaTextField.delegate = self
        usuarioTextField.delegate = self
        loginButton.isHidden = true
        loginButton.delegate = self
        loginButton.center = view.center
        view.addSubview(loginButton)

        
    }
    
    @IBAction func loginGoogleButtom(_ sender: Any) {
        viewModel.loginGoogle(presenter: self)
        
    }
    
    
    @IBAction func loginFacebookButtom(_ sender: Any) {
        
        loginButton.sendActions(for: .touchUpInside)
    }
    
    
    // quando o usuario clicar no botão de login ele é direcionado para a tela home
    @IBAction func loginAction(_ sender: Any) {
        viewModel.verifyUser(email: usuarioTextField.text, password: senhaTextField.text)
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

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension LoginViewController: LoginButtonDelegate {
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if error != nil {
            print(error)
        } else if result?.isCancelled == true {
            print("usuario cancelou login")
        } else{
            viewModel.tratarLoginFacebook(result: result, error: error)
        }
    }
    
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
