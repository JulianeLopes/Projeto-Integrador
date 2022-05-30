//
//  HomeViewController.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/05/30.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var filmeDestaqueImage: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var pesquisaTextField: UITextField!
    @IBOutlet weak var filmesDestaqueCollectionView: UICollectionView!
    
    let viewModel = HomeViewModel()
    var filmeDestaque: Filme?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filmeDestaque = Servico.filmeEmDestaque
        
        filmesDestaqueCollectionView.dataSource = self
        filmesDestaqueCollectionView.delegate = self
        filmeDestaqueImage.image = Servico.filmeEmDestaque.poster
        nomeLabel.text = "Olá, \(ServicoDeUsuario.user.nome)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detalhesVC = segue.destination as? FilmesDetalhesViewController {
            detalhesVC.filmeDestaque = filmeDestaque
        }
    }
    
    @IBAction func filmeDestaqueSaibaMais(_ sender: Any) {
        filmeDestaque = Servico.filmeEmDestaque
        performSegue(withIdentifier: "saibaMaisSegue", sender: filmeDestaque)
    }
    
    @IBAction func pesquisaButton(_ sender: Any) {
        
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numeroDeFilmesEmdestaques()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let filme = Servico.listaDeFilmeEmDestaques[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "destaquesCell", for: indexPath) as? FilmesEmDestaquesCollectionViewCell
        cell?.configuraCelula(filme: filme)
        
        return cell ?? UICollectionViewCell()
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var filme = Servico.listaDeFilmeEmDestaques[indexPath.item]
        
        filmeDestaque = filme
        
        performSegue(withIdentifier: "saibaMaisSegue", sender: filmeDestaque)
        
    }
}
