//
//  dadosPessoaisViewController.swift
//  ProjetoIntegrador
//
//  Created by Gui  on 31/05/22.
//

import UIKit

class DadosPessoaisViewController: UIViewController {

    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var fotoPerfil: UIImageView!
    

    let viewModel = DadosPessoaisViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        senhaTextField.delegate = self
        emailTextField.delegate = self
        configuraTela()
    }
    
    // configura a tela com dados do usuario
    private func configuraTela(){
        nomeLabel.text = "Olá \(viewModel.getNomeDoUsuario())"
        fotoPerfil.image = viewModel.getFotoDoUsuario()
        fotoPerfil.layer.cornerRadius = 100
        emailTextField.attributedText = NSAttributedString(string: viewModel.getEmailDoUsuario())
    }
    
    // botão de upload da foto
    @IBAction func uploadFotoButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true)
      viewWillAppear(true)
    }

    @IBAction func salvarDadosButton(_ sender: Any) {
        
        viewModel.mudarDadosPessoais(email: emailTextField.text, senha: senhaTextField.text, foto: fotoPerfil.image)
        
    }
}

extension DadosPessoaisViewController: DadosPessoaisDelegate {
    func erroAoAtualizarSenha() {
        let alerta = UIAlertController(title: "Erro ao atualizar a sua senha", message: "Tente novamente", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alerta.addAction(ok)
        self.present(alerta, animated: true, completion: nil)
    }
    
    func sucessoAoAtualizarSenha() {
        let alerta = UIAlertController(title: "Sucesso!", message: "Atualizamos sua senha", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alerta.addAction(ok)
        self.present(alerta, animated: true, completion: nil)
    }
    
    func erroAoAtualizarEmail() {
        let alerta = UIAlertController(title: "Erro ao atualizar seu email", message: "Tente novamente", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alerta.addAction(ok)
        self.present(alerta, animated: true, completion: nil)
    }
    
    func sucessoAoAtualizarEmail() {
        let alerta = UIAlertController(title: "Sucesso!", message: "Atualizamos seus dados!", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alerta.addAction(ok)
        self.present(alerta, animated: true, completion: nil)
    }
    
    
}

extension DadosPessoaisViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            fotoPerfil.image = image
        }
        // mudar foto no coredata e database
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

extension DadosPessoaisViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
