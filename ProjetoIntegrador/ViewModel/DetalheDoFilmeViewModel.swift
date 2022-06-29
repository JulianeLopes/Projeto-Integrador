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
    var spoiler = ServicoDeSpoiler()
    
    var delegate: FilmesViewModelDelegate?
    
    var favoritos: [Filme] {
        return (try? filmeEntityService.favoritos()) ?? []
    }
    
    
    private let filmeEntityService = FilmeEntityService()
    
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
        
        let exists = favoritos.contains { favorito in
            return favorito.title == filme.title
        }
        
        if exists {
            do {
             //   try filmeEntityService.remove(filme: filme)
                print("filme removido")
            }catch {
                print(error)
            }
       } else {
            do {
                try filmeEntityService.favoritar(filme: filme)
            } catch {
                print(error)
            }
        }
        delegate?.atualizaFavorito()
    }
}
