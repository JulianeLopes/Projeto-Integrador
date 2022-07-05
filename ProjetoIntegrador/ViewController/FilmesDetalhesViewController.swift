//
//  FilmesDetalhesViewController.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/05/30.
//

import UIKit
import ToastViewSwift

class FilmesDetalhesViewController: UIViewController {
    
    @IBOutlet weak var estrelaUmButton: UIButton!
    @IBOutlet weak var estrelaDoisButton: UIButton!
    @IBOutlet weak var estrelaTresButton: UIButton!
    @IBOutlet weak var estrelaQuatroButton: UIButton!
    @IBOutlet weak var estrelaCincoButton: UIButton!
    
    @IBOutlet weak var favoritarButton: UIButton!
    @IBOutlet weak var assistirDepoisButton: UIButton!
    @IBOutlet weak var assistidoBotton: UIButton!
    
    @IBOutlet weak var posterImage: UIImageView!
    
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var elencoLabel: UILabel!
    @IBOutlet weak var direcaoLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var indicacaoLabel: UILabel!
    
    var filmeDestaque: Filme?
    
    var viewModel = DetalheDoFilmeViewModel()
    var spoiler: Spoiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.filme = filmeDestaque
        viewModel.delegate = self
        viewModel.getPoster(filme: filmeDestaque) { image in
            self.posterImage.image = image
        }
        posterImage.layer.cornerRadius = 20
        tituloLabel.text = filmeDestaque?.title
        elencoLabel.text = spoiler?.elenco
        direcaoLabel.text = filmeDestaque?.directed_by
        descricaoLabel.text = filmeDestaque?.overview
        viewModel.getFavoritoButtonTitle()
        viewModel.getFilmesAssistidosButtonTitle()
        viewModel.getFilmesParaAssistirButtonTitle()
        viewModel.loadFilmesAssistidos()
        //colocar indicação
        
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let spoilerVC = segue.destination as? SpoilerViewController {
            spoilerVC.filmeDestaque = filmeDestaque
            spoilerVC.spoiler = spoiler
        }
    }
    
    @IBAction func favoritarAction(_ sender: Any) {

        viewModel.favorita(filme: filmeDestaque)
        viewModel.getFavoritoButtonTitle()
        // melhorar layout
        
    }
    
    @IBAction func assistirDepoisAction(_ sender: Any) {
        
        viewModel.assistirMaisTarde(filme: filmeDestaque)
        viewModel.getFilmesParaAssistirButtonTitle()
        
    }
    
    @IBAction func assistidoAction(_ sender: Any) {
        
        viewModel.assistido(filme: filmeDestaque)
        viewModel.getFilmesAssistidosButtonTitle()
        
        
        
    }
    
    @IBAction func buttonSpoiler(_ sender: Any) {
        
        let alerta = UIAlertController(title: "Alerta de Spoiler", message: "Agora é por sua conta e risco!", preferredStyle: UIAlertController.Style.alert)
                
                let telaSpoiler = UIAlertAction(title: "SIM", style: UIAlertAction.Style.default) { (UIAlertAction) in
                    
                    self.performSegue(withIdentifier: "telaSpoiler", sender: self.filmeDestaque)
                }


                let ok = UIAlertAction(title: "NÃO", style: UIAlertAction.Style.default, handler: nil)
                
                alerta.addAction(telaSpoiler)
                alerta.addAction(ok)
                
                self.present(alerta, animated: true, completion: nil)
        
    }
    
    @IBAction func pintarPrimeiraEstrela(_ sender: Any) {
        estrelaUmButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaDoisButton.setImage(UIImage(systemName: "star"), for: .normal)
        estrelaTresButton.setImage(UIImage(systemName: "star"), for: .normal)
        estrelaQuatroButton.setImage(UIImage(systemName: "star"), for: .normal)
        estrelaCincoButton.setImage(UIImage(systemName: "star"), for: .normal)
        
    }
    
    @IBAction func pintarSegundaEstrela(_ sender: Any) {
        estrelaUmButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaDoisButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaTresButton.setImage(UIImage(systemName: "star"), for: .normal)
        estrelaQuatroButton.setImage(UIImage(systemName: "star"), for: .normal)
        estrelaCincoButton.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
    @IBAction func pintarTerceiraEstrela(_ sender: Any) {
        estrelaUmButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaDoisButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaTresButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaQuatroButton.setImage(UIImage(systemName: "star"), for: .normal)
        estrelaCincoButton.setImage(UIImage(systemName: "star"), for: .normal)
        
    }
    
    @IBAction func pintarQuartaEstrela(_ sender: Any) {
        estrelaUmButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaDoisButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaTresButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaQuatroButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaCincoButton.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
    @IBAction func pintarQuintaEstrela(_ sender: Any) {
        estrelaUmButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaDoisButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaTresButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaQuatroButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaCincoButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
    }
    
    
}

extension FilmesDetalhesViewController: FilmesViewModelDelegate {
    func snackBarDesfavoritado() {
        let toast = Toast.default(
            image: UIImage(systemName: "heart")!,
            title: "Filme desfavoritado"
        )
        toast.show()
    }
    
    func snackBarFavoritado() {
        let toast = Toast.default(
            image: UIImage(systemName: "heart.fill")!,
            title: "Filme favoritado"
            
        )
        toast.show()
    }
    
    func atualizaButtonFilmeJaAssistido() {
        assistidoBotton.setImage(UIImage(systemName: "play.square.fill"), for: .normal)


    }
    
    func atualizaButtonFilmeAssistir() {
        assistidoBotton.setImage(UIImage(systemName: "play.square"), for: .normal)


    }
    
    func atualizaButtonAssistido() {
        assistirDepoisButton.setImage(UIImage(systemName: "text.badge.minus"), for: .normal)


    }
    
    func atualizaButtonParaAssistir() {
        assistirDepoisButton.setImage(UIImage(systemName: "text.badge.plus"), for: .normal)


    }
    
    func atualizaButtonFavoritado() {
        favoritarButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)

 
    }
    
    func atualizaButtonDesfavoritado() {
        favoritarButton.setImage(UIImage(systemName: "heart"), for: .normal)


    }
    
    
}



