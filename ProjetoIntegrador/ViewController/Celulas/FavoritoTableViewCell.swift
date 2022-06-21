//
//  FavoritoTableViewCell.swift
//  ProjetoIntegrador
//
//  Created by Fernanda Perovano on 29/05/22.
//

import UIKit

class FavoritoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var filmeImagem: UIImageView!
    @IBOutlet weak var nomeFilmeLabel: UILabel!
    
    func customizaCelula(filme: Filme) {
//        filmeImagem.image = filme.cover_url
        nomeFilmeLabel.text = filme.title
        filmeImagem.layer.cornerRadius = 20
    }
}
