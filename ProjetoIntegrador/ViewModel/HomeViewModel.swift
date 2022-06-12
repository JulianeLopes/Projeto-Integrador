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
    
//    func getDetalheDoFilmeViewModel(posicao: Int?) -> DetalheDoFilmeViewModel? {
//        guard let posicao = posicao else {
//            return nil
//        }
//        let filmeSelecionado = servico.listaDeFilmeEmDestaques[posicao]
//        let detalheViewModel = DetalheDoFilmeViewModel(filme: filmeSelecionado)
//        return detalheViewModel
//    }
}

    
