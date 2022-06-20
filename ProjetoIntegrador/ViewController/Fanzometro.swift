//
//  Fanzometro.swift
//  ProjetoIntegrador
//
//  Created by Giselle Andrade on 29/05/22.
//

import UIKit

class Fanzometro: UIViewController {
    
 
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var favoritosCollectionView: UICollectionView!
    @IBOutlet weak var porcentagemLabel: UILabel!
    
    let viewModel = FanzometroViewModel()


    override func viewDidLoad(){
        super.viewDidLoad()
        configuraTela()
    }
    
    // função para configurar a foto do usuário na tela
    private func configuraTela() {
        userImageView.image = UIImage(named: viewModel.getFotoUsuario())
        userImageView.layer.cornerRadius = 150
        userImageView.layer.borderWidth = 4
        userImageView.layer.borderColor = UIColor.red.cgColor
        favoritosCollectionView.dataSource = self
    }
    
    // para atualizar a lista de filmes favoritos toda vez que o usuario abre a tela pelo tabbar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoritosCollectionView.reloadData()
        porcentagemLabel.text = " \(viewModel.getFanzometroDoUsuario())% "
    }
    
}

// collection view dos filmes favoritos 
extension Fanzometro: UICollectionViewDataSource {
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.numeroDeFilmesFavoritos()
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
//    if error == true {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"errorViewCell", for:  indexPath) as? FanzometroCollectionViewCell
//       // montar a celula de erro
//        return cell
//    }
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"fanzometroCell", for:  indexPath) as? FanzometroCollectionViewCell
 
    let viewModel = viewModel.getViewModel(posicao: indexPath.row)
    
    cell?.customizaCelula(viewModel: viewModel)
    
    return cell ??  UICollectionViewCell()
}
    

}
    
