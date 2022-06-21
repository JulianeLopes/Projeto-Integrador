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
//        imagem.image = viewModel.getPoster()
        titulo.text = viewModel.getTitulo()
        imagem.layer.cornerRadius = 20
    }
}
