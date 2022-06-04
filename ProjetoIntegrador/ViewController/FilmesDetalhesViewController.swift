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

   
    @IBAction func buttonSpoiler(_ sender: Any) {
        
        let alerta = UIAlertController(title: "Alerta de Spoiler", message: "Agora é por sua conta e risco!", preferredStyle: UIAlertController.Style.alert)
                
                let telaSpoiler = UIAlertAction(title: "SIM", style: UIAlertAction.Style.default) { (UIAlertAction) in
                    
                    self.performSegue(withIdentifier: "telaSpoiler", sender: nil)
                }
                
                let telaListaDeFilmes = UIAlertAction(title: "NÃO", style: UIAlertAction.Style.default) { (UIAlertAction) in
                    
                    self.performSegue(withIdentifier: "telaListaDeFilmes", sender: nil)
                }

                let ok = UIAlertAction(title: "Continuar nesta tela", style: UIAlertAction.Style.default, handler: nil)
                
                alerta.addAction(telaSpoiler)
                alerta.addAction(telaListaDeFilmes)
                alerta.addAction(ok)
                
                self.present(alerta, animated: true, completion: nil)
        
    }
    
}
