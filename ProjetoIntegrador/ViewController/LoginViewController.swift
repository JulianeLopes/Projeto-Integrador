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
    var usuarioEnviado: Usuario?
    let viewModel = LoginViewModel()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func loginAction(_ sender: Any) {
        mudarDeTela(usuario: confereUsuario())
    }
    
    @IBAction func cadastrarNovoUsuarioButton(_ sender: Any) {
        performSegue(withIdentifier: "novoCadastro", sender: nil)
    }
    func apresentaAlerta() {
        
        let alerta = UIAlertController(title: "Usuário ou senha inválido", message: "Tente novamente", preferredStyle: UIAlertController.Style.alert)
                
                
                let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                
                alerta.addAction(ok)
                
                self.present(alerta, animated: true, completion: nil)
        
    }

    // conferir se o usuario existe
    
    func confereUsuario() -> Bool {
        var isSameUsuario: Bool = false
        let usuarioDig = usuarioTextField.text
        let senhaDigitada = senhaTextField.text
        
        for usuario in service.listaDeUsuario{
            if usuarioDig == usuario.email {
                if senhaDigitada == usuario.senha {
                      usuarioEnviado = usuario
                    isSameUsuario = true
                }
            }
        }
        
        return isSameUsuario
    }
        
    func mudarDeTela(usuario: Bool){
        if usuario == true {
            SessionMenager.shared.usuarioLogado = usuarioEnviado
            performSegue(withIdentifier: "appSegueIndentifier", sender: nil)
        } else {
            
            apresentaAlerta()
        }
    }
}

