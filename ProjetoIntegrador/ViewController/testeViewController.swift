//
//  testeViewController.swift
//  ProjetoIntegrador
//
//  Created by Juliane Lopes Moreira Rodrigues on 06/06/22.
//

import UIKit

class testeViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var usuarioEnviado: Usuario?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = usuarioEnviado?.nome
        
        // Do any additional setup after loading the view.
    }
    


}
