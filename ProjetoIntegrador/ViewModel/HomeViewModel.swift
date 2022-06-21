//
//  HomeViewModel.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/05/30.
//

import Foundation
import UIKit


class HomeViewModel {
    
    private let servicosDeAPI = MovieAPI()
//    private let servico = Servico()
    
    private var filmeSelecionado: Filme?
    
    // usuario logado
    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
    
    // recebe o nome do usuario logado
    func getNomeUsuario() -> String {
        guard let usuarioLogado = usuarioLogado else  { return "" }
        return usuarioLogado.nome
    }
    
    // quantidade de filmes
    func numeroDeFilmesEmdestaques() -> Int {
        return servicosDeAPI.getQuantidadeDeFilmes()
    }
    
    // envia dados do filme selecionado para a celula
    func getCellViewModel(posicao: Int) -> FilmeViewModel {
        let filme = servicosDeAPI.getListaDeFilme()[posicao]
        let cellViewModel = FilmeViewModel(filme: filme)
        return cellViewModel
    }
    
    // pega o filme selecionado da lista de filmes
    func getFilme(posicao: Int) -> Filme? {
       
        let filmeSelecionado = servicosDeAPI.getListaDeFilme()[posicao]
        return filmeSelecionado
    }
    
    // pega o posição do filme selecionado na lista
    func selecionarFilme(posicao: Int) {
        filmeSelecionado = getFilme(posicao: posicao)
    }

    private func selecionarFilme(filme: Filme) {
        filmeSelecionado = filme
    }
    
    // envia o filme selecionado para outra tela
    func getFilmeSelecionado() -> Filme? {
        return filmeSelecionado
    }
    
    // configura o filme de destaque
    func aplicarFilmePadrao() {
        selecionarFilme(filme: servicosDeAPI.getFilmeDestaque())
    }
    
    // configura o poster do filme
    func getPosterFilmeDestaque() -> UIImage? {
        let filmeDestaque = servicosDeAPI.getFilmeDestaque()
        return nil
    }
    
    func getFilmes(){
        servicosDeAPI.loadFilmes()
    }
}

    
