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
    // MARK: - Carregando filmes da API
    var servicoDeAPI = MovieAPI()
    var delegate: PesquisaViewModelDelegate?
    var listaDeFilme: [Filme] = []
    var filmeSelecionado: Filme?
    
    // MARK: - Spoilers
    var servicoDeSpoiler = ServicoDeSpoiler()
    var spoiler: Spoiler?
    
    // recebe a lista de filmes
    func getListaDeFilme() -> [Filme] {
        return listaDeFilme
    }
    
    // função de pesquisar o filme no textfield
    func pesquisarFilme(filmePesquisado: String?){

        let resultado = servicoDeAPI.filmesFromData.filter ({ filme in
            return filme.title?.lowercased().contains(filmePesquisado?.lowercased() ?? "") ?? false
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
        spoiler = getSpoiler(filme: filmeSelecionado)
        return filmeSelecionado
    }
    
    // pega a posição do filme selecionado
    func selecionarFilme(posicao: Int) {
        filmeSelecionado = getFilme(posicao: posicao)
        spoiler = getSpoiler(filme: filmeSelecionado)
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
    
    func getSpoiler() -> Spoiler? {
        return spoiler
    }
    
    func getSpoiler(filme: Filme?) -> Spoiler? {


        let spoilerExist = servicoDeSpoiler.listaDeFilmesSpoiler.first { tituloDoFilmeNoSpoiler in
            tituloDoFilmeNoSpoiler.title == filme?.title
        }
        spoiler = spoilerExist

        return spoiler
    }
    
}
