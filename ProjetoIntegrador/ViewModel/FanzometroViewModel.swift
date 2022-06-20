//
//  FanzometroViewModel.swift
//  ProjetoIntegrador
//
//  Created by Giselle Andrade on 29/05/22.
//

import Foundation
import UIKit

class FanzometroViewModel {
    
    let service = ServicoDeUsuario()
    
    // usuario logado
    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
    
    // quantidade filmes favoritos do usuario
    func numeroDeFilmesFavoritos() -> Int {
        guard let usuarioLogado = usuarioLogado else {
            return 0
        }

        return usuarioLogado.filmesFavoritos.count
        
    }
    
    // recebe a foto do usuario
    func getFotoUsuario() -> String {
        guard let usuarioLogado = usuarioLogado else { return "" }
        return usuarioLogado.foto
    }
    
    // calcula o nivel de fanzometro
    private func fanzometroPorcentagem(listaDeFavoritos: [Filme]) -> Double{
        
        let quantidadeDeFavoritos = Double(listaDeFavoritos.count)
        let quantidadeDeFilmes = Double(Servico.shared.listaDeFilmes.count)
        
        let porcentagemFanzometro = (quantidadeDeFavoritos / quantidadeDeFilmes)*100

        return porcentagemFanzometro
    }
    
    // retorna a porcentagem de fã do usuario
    func getFanzometroDoUsuario() -> Double {
        guard let usuarioLogado = usuarioLogado else { return 0.0 }
        return fanzometroPorcentagem(listaDeFavoritos: usuarioLogado.filmesFavoritos)
    }
    
    // envia os dados do filme para a celula
    func getViewModel(posicao: Int) -> FilmeViewModel {
        let filme = usuarioLogado?.filmesFavoritos[posicao]
            // verificar o !
        let cellViewModel = FilmeViewModel(filme: filme!)
        return cellViewModel
    }
}
