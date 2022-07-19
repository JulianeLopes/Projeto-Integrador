//
//  IndicacoesCollectionViewCell.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/07/12.
//

import UIKit

class IndicacoesCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var posterImage: UIImageView!
    
    
    func configuraCell(viewModel: FilmeViewModel){
        viewModel.getPoster { poster in
            self.posterImage.image = poster
        }
        posterImage.layer.cornerRadius = 20
        
    }
}
