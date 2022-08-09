//
//  FavoritoViewModel.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/06/08.
//

import Foundation

class FavoritoViewModel {
    let servicoDeSpoiler = ServicoDeSpoiler()
    
    var filmeSelecionado: Filme?
    var spoilerFilmeSelecionado: Spoiler?
    
    // lista de filmes a assistir
    var filmes: [Filme] {
        return usuarioLogadoEntities?.listaDeFilmesAssistirDepois ?? []
    }
    
    // usuario logado
    private var usuarioLogadoEntities: UsuarioEntities? {
        return SessionManager.shared.usuarioEntities
    }

    func numeroDeFilmesFavoritos() -> Int {
        return filmes.count

    }
    
    func getItem(row: Int) -> Filme {
        return filmes[row]
    
    }
    
    func getCellViewModel(posicao: Int) -> FilmeViewModel {
        let filme = filmes[posicao]
        let cellViewModel = FilmeViewModel(filme: filme)
        return cellViewModel
    }
    
    func getSpoiler(filme: Filme?) -> Spoiler? {
        let spoilerExist = servicoDeSpoiler.listaDeFilmesSpoiler.first { tituloDoFilmeNoSpoiler in
            tituloDoFilmeNoSpoiler.title == filme?.title
        }
        return spoilerExist
    }
    
    func selecionarFilme(posicao: Int){
        filmeSelecionado = getItem(row: posicao)
        spoilerFilmeSelecionado = getSpoiler(filme: filmeSelecionado)
    }
    
    
}
