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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fotoPerfil.image = UIImage(named: ServicoDeUsuario.user.foto ?? "")
        fotoPerfil.layer.cornerRadius = 125
        
    }
    
    @IBAction func uploadFotoButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true)

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
