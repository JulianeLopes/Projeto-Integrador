//
//  Filme.swift
//  ProjetoIntegrador
//
//  Created by Fernanda Perovano on 29/05/22.
//

import UIKit

class Filme {
    var titulo: String
    var elenco: String
    var direcao: String
    var descricao: String
//    var indicacaoDeFilmes: [Filme?]
    var poster: UIImage?
    
    init(titulo: String, elenco: String, direcao: String, descricao: String, poster: UIImage? ){
        self.titulo = titulo
        self.elenco = elenco
        self.direcao = direcao
        self.descricao = descricao
      //  self.indicacaoDeFilmes = indicacaoDeFilmes
        self.poster = poster
    }
}
