//
//  FanzometroCollectionViewCell.swift
//  ProjetoIntegrador
//
//  Created by Giselle Andrade on 29/05/22.
//

import UIKit

class FanzometroCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterCollectionViewCell: UIImageView!
    
    func customizaCelula(filme: Filme) {
        posterCollectionViewCell.image = filme.poster
        posterCollectionViewCell.layer.cornerRadius = 20
    }
}
