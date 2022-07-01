//
//  SpoilerViewController.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/06/08.
//

import UIKit

class SpoilerViewController: UIViewController {

    @IBOutlet weak var textoSpoiler: UILabel!
    @IBOutlet weak var textoQuantidadeCenasPosCredito: UILabel!
    @IBOutlet weak var textoSpoilerCenasPosCredito: UILabel!
    
    var filmeDestaque: Filme?
    var spoiler: Spoiler?
    var viewModel = SpoilerViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.filme = filmeDestaque
        viewModel.spoiler = spoiler
        textoSpoiler.text = viewModel.getTextSpoiler()
        textoQuantidadeCenasPosCredito.text = "\(viewModel.getQuantidadeDeCenasPosCredito())"
        textoSpoilerCenasPosCredito.text = ""
        
    }
    
    @IBAction func lerSpoilerCenasPosCredito(_ sender: Any) {
        textoSpoilerCenasPosCredito.text = viewModel.getTextDescricaoSpoiler()
    }
    
    @IBAction func fecharTelaBotao(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
