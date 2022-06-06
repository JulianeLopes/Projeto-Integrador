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
    
    func configuraCelula(filme: Filme){
        imagem.image = filme.poster
        titulo.text = filme.titulo
    }
}
