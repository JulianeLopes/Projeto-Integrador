//
//  HomeViewModel.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/05/30.
//

import Foundation
import UIKit


class HomeViewModel {
    
    private let servico = Servico()
    
    private var filmeSelecionado: Filme?
    
    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
    
    func getNomeUsuario() -> String {
        guard let usuarioLogado = usuarioLogado else  { return "" }
        return usuarioLogado.nome
    }
    
    func numeroDeFilmesEmdestaques() -> Int {
        return Servico.shared.listaDeFilmeEmDestaques.count
    }
    
    func getCellViewModel(posicao: Int) -> FilmeViewModel {
        let filme = servico.listaDeFilmeEmDestaques[posicao]
        let cellViewModel = FilmeViewModel(filme: filme)
        return cellViewModel
    }
    
    func getFilme(posicao: Int) -> Filme? {
       
        let filmeSelecionado = servico.listaDeFilmeEmDestaques[posicao]
        return filmeSelecionado
    }
    
    func selecionarFilme(posicao: Int) {
        filmeSelecionado = getFilme(posicao: posicao)
    }
    
    private func selecionarFilme(filme: Filme) {
        filmeSelecionado = filme
    }
    
    func getFilmeSelecionado() -> Filme? {
        return filmeSelecionado
    }
    
    func aplicarFilmePadrao() {
        selecionarFilme(filme: Servico.shared.filmeEmDestaque)
    }
    
    func getPosterFilmeDestaque() -> UIImage? {
        Servico.shared.filmeEmDestaque.poster
    }
}

    
