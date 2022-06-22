//
//  FanzometroViewModel.swift
//  ProjetoIntegrador
//
//  Created by Giselle Andrade on 29/05/22.
//

import Foundation
import UIKit

class FanzometroViewModel {
    
    var servicoDeAPI = MovieAPI()
    let service = ServicoDeUsuario()
    
    var porcentagem: String = ""
    var filmes: [Filme] = []
    
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
    private func fanzometroPorcentagem(listaDeFavoritos: [Filme]) -> String {
        getFilmesDaApi {
            self.filmes
                let quantidadeDeFavoritos = Int(listaDeFavoritos.count)
                let quantidadeDeFilmes = Int(self.filmes.count)
                let porcentagemFanzometro = (100 * quantidadeDeFavoritos) / quantidadeDeFilmes
            self.porcentagem = "\(porcentagemFanzometro)"
        }
        
        return porcentagem
       
    }
    
    // retorna a porcentagem de fã do usuario
    func getFanzometroDoUsuario() -> String {
        guard let usuarioLogado = usuarioLogado else { return "" }
        return fanzometroPorcentagem(listaDeFavoritos: usuarioLogado.filmesFavoritos)
    }
    
    // envia os dados do filme para a celula
    func getViewModel(posicao: Int) -> FilmeViewModel {
        // faz guard let e no return chama uma celula com a tratativa de erro, tratativa de erro no servico 
        let filme = usuarioLogado?.filmesFavoritos[posicao]
            // verificar o !
        let cellViewModel = FilmeViewModel(filme: filme!)
        return cellViewModel
    }
    
    func getFilmesDaApi(completion: @escaping ()-> Void ){
        servicoDeAPI.loadFilmes { filmes in
            self.filmes = filmes
            completion()
        }
    }
}
