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
    var delegate: PesquisaViewModelDelegate?
    var listaDeFilme: [Filme] = []

    func getListaDeFilme() -> [Filme] {
        listaDeFilme = Servico.shared.listaDeFilmes
        return listaDeFilme
    }
    
    func pesquisarFilme(filmePesquisado: String?){
        let resultado = getListaDeFilme().filter ({ filme in
            return filme.titulo.lowercased().contains(filmePesquisado?.lowercased() ?? "")
        })
        if filmePesquisado != nil && filmePesquisado != ""{
            listaDeFilme = resultado
        } else {
            getListaDeFilme()
        }

        delegate?.atualizalista()
    }
}
