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
    var servicoDeApi = MovieAPI()
    
    var delegate: FilmesViewModelDelegate?
//    var servico = Servico()
    
    // usuario logado
    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
    
    func getPoster(filme: Filme?, completion: @escaping (UIImage?) -> Void) {
        servicoDeApi.getPosterFilmeDestaqueDaApi(url: filme?.cover_url, completion: completion)
        
    }
    
    // função de favoritar filmes
    // ver o pq não chega aqui
    func favorita(filme: Filme?){
        guard let filme = filme else { return }
        usuarioLogado?.filmesFavoritos.append(filme)
        print(usuarioLogado?.filmesFavoritos)
        delegate?.atualizaFavorito()
    }
}
