//
//  ViewController.swift
//  ProjetoIntegrador
//
//  Created by Juliane Lopes Moreira Rodrigues on 25/05/22.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var usuarioTextField: UITextField!
    
    @IBOutlet weak var senhaTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // colocar limpar texto no final do textField
        usuarioTextField.clearButtonMode = .whileEditing
        
    }
    
}
    


