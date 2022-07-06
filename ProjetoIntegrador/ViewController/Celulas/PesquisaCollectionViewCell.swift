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
        viewModel.getPoster(completion: { image in
            DispatchQueue.main.async {
                self.imagem.image = image
                if image == nil {
                    self.imagem.image = UIImage(named: "default_poster")
                }
            }
        })
        titulo.text = viewModel.getTitulo()
        imagem.layer.cornerRadius = 20
    }
}
