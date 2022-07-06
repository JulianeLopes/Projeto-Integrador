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
        viewModel.getPoster { image in
            self.posterCollectionViewCell.image = image
            if image == nil {
                self.posterCollectionViewCell.image = UIImage(named: "default_poster")
            }
        }
        posterCollectionViewCell.layer.cornerRadius = 20
    }
}
