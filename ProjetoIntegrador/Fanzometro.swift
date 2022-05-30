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
        userImageView.image = UIImage(named: ServicoDeUsuario.user.foto ?? " ")
        userImageView.layer.cornerRadius = 150
        userImageView.layer.borderWidth = 4
        userImageView.layer.borderColor = UIColor.red.cgColor
        favoritosCollectionView.dataSource = self
    
       
    }
    
}

extension Fanzometro: UICollectionViewDataSource {
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.numeroDeFilmesFavoritos()
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"fanzometroCell", for:  indexPath) as? FanzometroCollectionViewCell
    cell?.customizaCelula(usuario: ServicoDeUsuario.user )
    
    return cell ??  UICollectionViewCell()
}
}
    
