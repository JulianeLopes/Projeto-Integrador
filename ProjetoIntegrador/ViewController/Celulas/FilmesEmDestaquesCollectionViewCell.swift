//
//  FilmesEmDestaquesCollectionViewCell.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/05/30.
//

import UIKit

class FilmesEmDestaquesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var posterImage: UIImageView!
    
    func configuraCelula(viewModel: FilmeViewModel) {

        viewModel.getPoster { image in
            DispatchQueue.main.async {
                self.posterImage.image = image
                if image == nil {
                    self.posterImage.image = UIImage(named: "default_poster")
                }
            }
        }
        
        posterImage.layer.cornerRadius = 20
    }
}
