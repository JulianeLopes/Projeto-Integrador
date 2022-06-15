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
    @IBOutlet weak var filmesDestaqueCollectionView: UICollectionView!
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.aplicarFilmePadrao()
        filmesDestaqueCollectionView.dataSource = self
        filmesDestaqueCollectionView.delegate = self
        filmeDestaqueImage.image = Servico.shared.filmeEmDestaque.poster
        configuraTela()
    }
    
//visualizar os detalhes do filme selecionado
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detalhesVC = segue.destination as? FilmesDetalhesViewController {
            detalhesVC.filmeDestaque = viewModel.getFilmeSelecionado()
        }
    }
    
    //visualizar os detalhes do filme em destaque
    @IBAction func filmeDestaqueSaibaMais(_ sender: Any) {
        viewModel.aplicarFilmePadrao()
        performSegue(withIdentifier: "saibaMaisSegue", sender: nil)
    }
    
    //demostra o nome do usuário logado e o cumprimenta
    func configuraTela(){
        nomeLabel.text = "Olá, \(viewModel.getNomeUsuario())"
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numeroDeFilmesEmdestaques()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "destaquesCell", for: indexPath) as? FilmesEmDestaquesCollectionViewCell
        let cellViewModel = viewModel.getCellViewModel(posicao: indexPath.row)
        cell?.configuraCelula(viewModel: cellViewModel)
        return cell ?? UICollectionViewCell()
    }
}


// fazer mvvm de segue
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selecionarFilme(posicao: indexPath.row)
        performSegue(withIdentifier: "saibaMaisSegue", sender: nil)
    }
}
