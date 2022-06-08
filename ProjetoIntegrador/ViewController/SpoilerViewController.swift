//
//  SpoilerViewController.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/06/08.
//

import UIKit

class SpoilerViewController: UIViewController {

    @IBOutlet weak var textoSpoiler: UILabel!
    @IBOutlet weak var textoCenaPósCrédito: UILabel!
    
    var filmeDestaque: Filme?
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraTexto()

    }


    func configuraTexto(){
        textoSpoiler.text = filmeDestaque?.spoiler
        textoCenaPósCrédito.text = filmeDestaque?.cenaPosCredito
    }
}
