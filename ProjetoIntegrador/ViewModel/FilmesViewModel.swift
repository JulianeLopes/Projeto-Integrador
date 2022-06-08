//
//  FilmesViewModel.swift
//  ProjetoIntegrador
//
//  Created by Juliane Lopes Moreira Rodrigues on 08/06/22.
//

import Foundation

protocol FilmesViewModelDelegate {
    func atualizaFavorito()
    
}



class FilmesViewModel{
    var delegate: FilmesViewModelDelegate?
    
    func favorita(filme: Filme){
        usuarioLogado?.filmesFavoritos.append(filme)
        
        delegate?.atualizaFavorito()
    }
    
    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
}


