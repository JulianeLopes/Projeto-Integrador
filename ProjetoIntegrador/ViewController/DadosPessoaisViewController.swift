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
    
    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
    
//    var fotoUsuario: String = usuarioLogado?.foto
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomeLabel.text = "Olá \(converteParaString(string: usuarioLogado?.nome))"
        fotoPerfil.image = UIImage(named: usuarioLogado?.foto ?? "")
        fotoPerfil.layer.cornerRadius = 125
        
    }
    
    @IBAction func uploadFotoButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true)
        viewWillAppear(true)
    }
    
    func converteParaString(string: String?) -> String {
        guard let string = string else { return ""}
        return string
    }
}



extension DadosPessoaisViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            fotoPerfil.image = image
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
