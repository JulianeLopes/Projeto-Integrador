//
//  DetalheDoFilmeViewModel.swift
//  ProjetoIntegrador
//
//  Created by Fernanda Perovano on 12/06/22.
//

import Foundation
import UIKit

protocol FilmesViewModelDelegate {
    func atualizaFavorito()
    
}

class DetalheDoFilmeViewModel {
    var delegate: FilmesViewModelDelegate?
    var servico = Servico()
    
    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
    
    func favorita(filme: Filme?){
        guard let filme = filme else { return }
        usuarioLogado?.filmesFavoritos.append(filme)
        delegate?.atualizaFavorito()
    }
}
