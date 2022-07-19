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
    @IBOutlet weak var diretoresLabel: UILabel!
    
    func customizaCelula(viewModel: FilmeViewModel) {
            viewModel.getPoster { image in
                self.filmeImagem.image = image
            }
        filmeImagem.layer.cornerRadius = 20
        nomeFilmeLabel.text = viewModel.getTitulo()
        diretoresLabel.text = viewModel.getDirecao()
    }
}
