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
    var indicacaoDeFilmes: [Filme]
    var poster: UIImage?
    var spoiler: String
    var cenaPosCredito: String
    
    
    init(titulo: String, elenco: String, direcao: String, descricao: String, indicacaoDeFilmes: [Filme], poster: UIImage?, spoiler: String, cenaPosCredito: String){
        self.titulo = titulo
        self.elenco = elenco
        self.direcao = direcao
        self.descricao = descricao
        self.indicacaoDeFilmes = indicacaoDeFilmes
        self.poster = poster
        self.spoiler = spoiler
        self.cenaPosCredito = cenaPosCredito
    }
}
