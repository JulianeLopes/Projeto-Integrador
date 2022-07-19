//
//  FilmesDetalhesViewController.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/05/30.
//

import UIKit
import ToastViewSwift

protocol FilmesDetalhesViewControllerDelegate {
    func viewWillDisappear()
}


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
    
    @IBOutlet weak var indicacaoFilmesCollectionView: UICollectionView!
    
    var filmeDestaque: Filme?
    var delegate: FilmesDetalhesViewControllerDelegate?
    var viewModel = DetalheDoFilmeViewModel()
    var spoiler: Spoiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.filme = filmeDestaque
        viewModel.spoilerFilme = spoiler
        viewModel.delegate = self
        viewModel.getPoster(filme: filmeDestaque) { image in
            self.posterImage.image = image
            if image == nil {
                self.posterImage.image = UIImage(named: "default_poster")
            }
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
        viewModel.loadAvaliados()
        viewModel.getAvaliacao()
        
        //indicação
        indicacaoFilmesCollectionView.dataSource = self
        viewModel.getFilmesApi {
            self.indicacaoFilmesCollectionView.reloadData()
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.viewWillDisappear()
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
        viewModel.avaliaFilme(filme: filmeDestaque, avaliacao: 1)
        
    }
    
    @IBAction func pintarSegundaEstrela(_ sender: Any) {
        viewModel.avaliaFilme(filme: filmeDestaque, avaliacao: 2)
    }
    
    @IBAction func pintarTerceiraEstrela(_ sender: Any) {
        viewModel.avaliaFilme(filme: filmeDestaque, avaliacao: 3)
        
    }
    
    @IBAction func pintarQuartaEstrela(_ sender: Any) {
        viewModel.avaliaFilme(filme: filmeDestaque, avaliacao: 4)
    }
    
    @IBAction func pintarQuintaEstrela(_ sender: Any) {
        viewModel.avaliaFilme(filme: filmeDestaque, avaliacao: 5)
    }
    
    
}

extension FilmesDetalhesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getQuantidadeDeFilmesIndicados()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "indicacoes", for: indexPath) as? IndicacoesCollectionViewCell
        let cellViewModel = viewModel.getCellViewModel(posicao: indexPath.row)
        cell?.configuraCell(viewModel: cellViewModel)
        
        return cell ?? UICollectionViewCell()
    }
    
    
}

extension FilmesDetalhesViewController: FilmesViewModelDelegate {
    func avaliaFilmeZero() {
        estrelaUmButton.setImage(UIImage(systemName: "star"), for: .normal)
        estrelaDoisButton.setImage(UIImage(systemName: "star"), for: .normal)
        estrelaTresButton.setImage(UIImage(systemName: "star"), for: .normal)
        estrelaQuatroButton.setImage(UIImage(systemName: "star"), for: .normal)
        estrelaCincoButton.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
    func avaliaFilmeUm() {
        estrelaUmButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaDoisButton.setImage(UIImage(systemName: "star"), for: .normal)
        estrelaTresButton.setImage(UIImage(systemName: "star"), for: .normal)
        estrelaQuatroButton.setImage(UIImage(systemName: "star"), for: .normal)
        estrelaCincoButton.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
    func avaliaFilmeDois() {
        estrelaUmButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaDoisButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaTresButton.setImage(UIImage(systemName: "star"), for: .normal)
        estrelaQuatroButton.setImage(UIImage(systemName: "star"), for: .normal)
        estrelaCincoButton.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
    func avaliaFilmeTres() {
        estrelaUmButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaDoisButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaTresButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaQuatroButton.setImage(UIImage(systemName: "star"), for: .normal)
        estrelaCincoButton.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
    func avaliaFilmeQuatro() {
        estrelaUmButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaDoisButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaTresButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaQuatroButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaCincoButton.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
    func avaliaFilmeCinco() {
        estrelaUmButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaDoisButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaTresButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaQuatroButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        estrelaCincoButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
    }
    
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
    func snackBarAssistido() {
        let toast = Toast.default(
            image: UIImage(systemName: "text.badge.minus")!,
            title: "Filme retirado da lista"
        )
        toast.show()
    }
    
    func snackBarAssistirMaisTarde() {
        let toast = Toast.default(
            image: UIImage(systemName: "text.badge.plus")!,
            title: "Filme adicionado na lista"
            
        )
        toast.show()
    }
    
    func snackBarFilmeAssistido() {
        let toast = Toast.default(
            image: UIImage(systemName: "play.square.fill")!,
            title: "Filme assistido"
            
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



