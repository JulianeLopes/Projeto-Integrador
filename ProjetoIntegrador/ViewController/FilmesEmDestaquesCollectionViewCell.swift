//
//  FilmesEmDestaquesCollectionViewCell.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/05/30.
//

import UIKit

class FilmesEmDestaquesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var posterImage: UIImageView!
    
    func configuraCelula(filme: Filme){
        posterImage.image = filme.poster
        posterImage.layer.cornerRadius = 20
    }
    
}
