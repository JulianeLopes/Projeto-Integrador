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
        configuraTela()
    }
    
    // configura a tela com dados do usuario
    private func configuraTela(){
        nomeLabel.text = "Olá \(viewModel.getNomeDoUsuario())"
        fotoPerfil.image = UIImage(named: viewModel.getFotoDoUsuario())
        fotoPerfil.layer.cornerRadius = 125
    }
    
    // botão de upload da foto
    @IBAction func uploadFotoButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true)
        viewWillAppear(true)
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
