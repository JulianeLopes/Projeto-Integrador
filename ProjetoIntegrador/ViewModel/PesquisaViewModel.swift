//
//  PesquisaViewModel.swift
//  ProjetoIntegrador
//
//  Created by Juliane Lopes Moreira Rodrigues on 06/06/22.
//

import Foundation

protocol PesquisaViewModelDelegate {
    func atualizalista()
}

class PesquisaViewModel {
    
    var servicoDeAPI = MovieAPI()
    var delegate: PesquisaViewModelDelegate?
    var listaDeFilme: [Filme] = []
    var filmeSelecionado: Filme?

    // recebe a lista de filmes
    func getListaDeFilme() -> [Filme] {
        return listaDeFilme
    }
    
    // função de pesquisar o filme no textfield
    func pesquisarFilme(filmePesquisado: String?){

        let resultado = listaDeFilme.filter ({ filme in
            return filme.title.lowercased().contains(filmePesquisado?.lowercased() ?? "")
        })
        if filmePesquisado != nil && filmePesquisado != ""{
            listaDeFilme = resultado
        } else {
            listaDeFilme = servicoDeAPI.filmesFromData
        }
        delegate?.atualizalista()
    }
    
    // recebe o filme na celula
    func getCellViewModel(posicao: Int) -> FilmeViewModel {
        let filme = listaDeFilme[posicao]
        let cellViewModel = FilmeViewModel(filme: filme)
        return cellViewModel
    }
    
    // pega a posição do filme na lista
    func getFilme(posicao: Int) -> Filme? {
        let filmeSelecionado = listaDeFilme[posicao]
        return filmeSelecionado
    }
    
    // pega a posição do filme selecionado
    func selecionarFilme(posicao: Int) {
        filmeSelecionado = getFilme(posicao: posicao)
    }
    
    // recebe o filme selecionado e envia para outra tela
    func getFilmeSelecionado() -> Filme? {
        return filmeSelecionado
    }
    
    func getFilmesDaAPI(completion: @escaping () -> Void){
        servicoDeAPI.loadFilmes { filmes in
            self.listaDeFilme = filmes
            completion()
        }
    }
    
}
