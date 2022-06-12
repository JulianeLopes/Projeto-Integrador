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
        posterImage.image = viewModel.getPoster()
        posterImage.layer.cornerRadius = 20
    }
}
