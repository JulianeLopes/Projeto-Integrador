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


   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HomeViewController {
            destination.usuarioEnviado = usuarioEnviado
        }
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
            performSegue(withIdentifier: "appSegueIndentifier", sender: usuarioEnviado)
            usuarioTextField.layer.borderWidth = 1
            senhaTextField.layer.borderWidth = 1
            usuarioTextField.layer.borderColor = UIColor.clear.cgColor
            senhaTextField.layer.borderColor = UIColor.clear.cgColor
        } else {
            usuarioTextField.layer.borderWidth = 1
            senhaTextField.layer.borderWidth = 1
            usuarioTextField.layer.borderColor = UIColor.black.cgColor
            senhaTextField.layer.borderColor = UIColor.black.cgColor
        }
    }
}

