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
    
//    let service = ServicoDeUsuario()
    var novoUsuarioCriado: Usuario = Usuario(nome: "", email: "", senha: "", foto: "", nivelDeFa: 0.0, filmesFavoritos: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func cadastrarButton(_ sender: Any) {
        ServicoDeUsuario.listaDeUsuario.append(novoUsuario())
        dismiss(animated: true) {
            self.performSegue(withIdentifier: "voltarIdentifier", sender: self.novoUsuarioCriado)
        }
    }
    
    func novoUsuario() -> Usuario {
        if let nome = nomeTextField.text, let email = emailTextField.text, let senha = senhaTextField.text {
            
            novoUsuarioCriado = Usuario(nome: nome, email: email, senha: senha, foto: "", nivelDeFa: 0.0, filmesFavoritos: [])
            
            
            return novoUsuarioCriado
        }
        return novoUsuarioCriado
    }
    
}
