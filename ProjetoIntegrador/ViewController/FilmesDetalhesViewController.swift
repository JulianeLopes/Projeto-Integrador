//
//  FilmesDetalhesViewController.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/05/30.
//

import UIKit

class FilmesDetalhesViewController: UIViewController {
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var elencoLabel: UILabel!
    @IBOutlet weak var direcaoLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var indicacaoLabel: UILabel!
    
    var filmeDestaque: Filme?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posterImage.image = filmeDestaque?.poster
        tituloLabel.text = filmeDestaque?.titulo
        elencoLabel.text = filmeDestaque?.elenco
        direcaoLabel.text = filmeDestaque?.direcao
        descricaoLabel.text = filmeDestaque?.descricao
        //colocar indicação
        
        // Do any additional setup after loading the view.
    }
    @IBAction func spoilerButton(_ sender: Any) {
    }
    

}
