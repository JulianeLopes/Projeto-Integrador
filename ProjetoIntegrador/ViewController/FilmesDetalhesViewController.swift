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
    @IBOutlet weak var favoritarButton: UIButton!
    
    var filmeDestaque: Filme?
    
    var viewModel = FilmesViewModel()
    
    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        posterImage.image = filmeDestaque?.poster
        posterImage.layer.cornerRadius = 20
        tituloLabel.text = filmeDestaque?.titulo
        elencoLabel.text = filmeDestaque?.elenco
        direcaoLabel.text = filmeDestaque?.direcao
        descricaoLabel.text = filmeDestaque?.descricao
        //colocar indicação
        
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let spoilerVC = segue.destination as? SpoilerViewController {
            spoilerVC.filmeDestaque = filmeDestaque
        }
    }
    
    @IBAction func favoritarAction(_ sender: Any) {
        favoritarButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        viewModel.favorita(filme: filmeDestaque!)
        
    }
    
    @IBAction func buttonSpoiler(_ sender: Any) {
        
        let alerta = UIAlertController(title: "Alerta de Spoiler", message: "Agora é por sua conta e risco!", preferredStyle: UIAlertController.Style.alert)
                
                let telaSpoiler = UIAlertAction(title: "SIM", style: UIAlertAction.Style.default) { (UIAlertAction) in
                    
                    self.performSegue(withIdentifier: "telaSpoiler", sender: self.filmeDestaque)
                }
<<<<<<< HEAD
                
                let telaListaDeFilmes = UIAlertAction(title: "NÃO", style: UIAlertAction.Style.default,  handler: nil)

                alerta.addAction(telaSpoiler)
                alerta.addAction(telaListaDeFilmes)
=======

                let ok = UIAlertAction(title: "NÃO", style: UIAlertAction.Style.default, handler: nil)
                
                alerta.addAction(telaSpoiler)
                alerta.addAction(ok)
>>>>>>> main
                
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


