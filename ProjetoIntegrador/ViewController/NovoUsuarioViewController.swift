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
        nomeTextField.delegate = self
        emailTextField.delegate = self
        senhaTextField.delegate = self
    }
    
    // cadastrar usuario
    @IBAction func cadastrarButton(_ sender: Any) {
        viewModel.registrarUsuario(email: emailTextField.text, senha: senhaTextField.text, nome: nomeTextField.text)
    }
}

extension NovoUsuarioViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
// capta todas as acoes do usuario na tela
extension NovoUsuarioViewController: NovoUsuarioViewModelDelegate {
    //  cadastro efetuado corretamente e redireciona para a tela home
    func usuarioCadastrado() {
        performSegue(withIdentifier: "usuarioCadastradoSegue", sender: nil)
    }
    
    // alerta de dados incorretos
    func alertaDadosDeCadastroIncorretos() {
        let alerta = UIAlertController(title: "Dados Incorretos", message: "Insira um email válido e uma senha de 6 caracteres", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        alerta.addAction(ok)
        present(alerta, animated: true)
    }
}
