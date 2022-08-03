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
    @IBOutlet weak var addFotoButton: UIButton!
    @IBOutlet weak var fotoUser: UIImageView!
    
    let viewModel = NovoUsuarioViewModel()
    private var userImage: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addFotoButton.layer.masksToBounds = true
        addFotoButton.layer.borderWidth = 4
        addFotoButton.layer.cornerRadius = 150/2
        addFotoButton.layer.borderColor = UIColor.red.cgColor
        viewModel.delegate = self
        nomeTextField.delegate = self
        emailTextField.delegate = self
        senhaTextField.delegate = self
        
    }
    
    // cadastrar usuario
    @IBAction func cadastrarButton(_ sender: Any) {
        let foto = userImage?.image
        viewModel.registrarUsuario(nome: nomeTextField.text, senha: senhaTextField.text, email: emailTextField.text, fotoUsuario: foto)
    
    }
    
    // cadastrar foto do usuario
    
    @IBAction func fotoUsuarioButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true)
        viewWillAppear(true)
    }
    
}
extension NovoUsuarioViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            
           
            self.userImage?.image = image
         //   self.addFotoButton.setImage(image, for: .normal)
            
            
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
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
