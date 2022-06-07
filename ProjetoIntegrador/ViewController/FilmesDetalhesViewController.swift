//
//  FilmesDetalhesViewController.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/05/30.
//

import UIKit

class FilmesDetalhesViewController: UIViewController {
    
    @IBOutlet weak var estrelaUmButton: UIButton!
    @IBOutlet weak var estrelaDoisButton: UIButton!
    @IBOutlet weak var estrelaTresButton: UIButton!
    @IBOutlet weak var estrelaQuatroButton: UIButton!
    @IBOutlet weak var estrelaCincoButton: UIButton!
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var elencoLabel: UILabel!
    @IBOutlet weak var direcaoLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var indicacaoLabel: UILabel!
    
    var filmeDestaque: Filme?
   // var estrelaImagemPintada = UIImage(named: "star.fill") as! UIImage
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posterImage.image = filmeDestaque?.poster
        posterImage.layer.cornerRadius = 20
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

                let ok = UIAlertAction(title: "NÃO", style: UIAlertAction.Style.default, handler: nil)
                
                alerta.addAction(telaSpoiler)
                alerta.addAction(ok)
                
                self.present(alerta, animated: true, completion: nil)
        
    }
    
    @IBAction func pintarPrimeiraEstrela(_ sender: Any) {
        estrelaUmButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
    }
    @IBAction func pintarSegundaEstrela(_ sender: Any) {
        estrelaUmButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaDoisButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
    }
    @IBAction func pintarTerceiraEstrela(_ sender: Any) {
        estrelaUmButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaDoisButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaTresButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
    }
    @IBAction func pintarQuartaEstrela(_ sender: Any) {
        estrelaUmButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaDoisButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaTresButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaQuatroButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
    }
    @IBAction func pintarQuintaEstrela(_ sender: Any) {
        estrelaUmButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaDoisButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaTresButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaQuatroButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaCincoButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
    }
    
    
}
