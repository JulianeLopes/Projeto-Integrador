//
//  DetalheDoFilmeViewModel.swift
//  ProjetoIntegrador
//
//  Created by Fernanda Perovano on 12/06/22.
//

import Foundation
import UIKit

class DetalheDoFilmeViewModel {
    
    private let filme: Filme
    
    init(filme: Filme) {
        self.filme = filme
    }
    
    func getPoster() -> UIImage? {
        guard let image = filme.poster else {
            return nil
        }
        return image
    }
    
    func getTitulo() -> String {
        return filme.titulo
    }
    
    func getElenco() -> String {
        return filme.elenco
    }
    
    func getDirecao() -> String {
        return filme.direcao
    }
    
    func getDescricao() -> String {
        return filme.descricao
    }
}
