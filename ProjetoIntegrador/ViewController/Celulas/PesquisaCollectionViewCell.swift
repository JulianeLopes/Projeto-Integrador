//
//  PesquisaCollectionViewCell.swift
//  ProjetoIntegrador
//
//  Created by Juliane Lopes Moreira Rodrigues on 06/06/22.
//

import UIKit

class PesquisaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    
    func configuraCelula(viewModel: FilmeViewModel){
        viewModel.getPoster { image in
            DispatchQueue.main.async {
                self.imagem.image = image
            }
        }
        titulo.text = viewModel.getTitulo()
        imagem.layer.cornerRadius = 20
    }
}
