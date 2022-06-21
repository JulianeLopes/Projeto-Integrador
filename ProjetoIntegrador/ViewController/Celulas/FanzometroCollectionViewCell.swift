//
//  FanzometroCollectionViewCell.swift
//  ProjetoIntegrador
//
//  Created by Giselle Andrade on 29/05/22.
//

import UIKit

class FanzometroCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterCollectionViewCell: UIImageView!
    
    func customizaCelula(viewModel: FilmeViewModel) {
//        posterCollectionViewCell.image = viewModel.getPoster()
        posterCollectionViewCell.layer.cornerRadius = 20
    }
}
