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
    let filmeEntityService = FilmeEntityService()
    
    var porcentagem: String = ""
    var filmes: [Filme] = []
    
    // usuario logado
    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
    
    // quantidade filmes favoritos do usuario
    func numeroDeFilmesFavoritos() -> Int {
        return ((try? filmeEntityService.favoritos()) ?? []).count
        
    }
    
    // recebe a foto do usuario
    func getFotoUsuario() -> String {
        guard let usuarioLogado = usuarioLogado else { return "" }
        return usuarioLogado.foto
    }
    
    // calcula o nivel de fanzometro
    private func fanzometroPorcentagem(listaDeFavoritos: [Filme], completion: @escaping (String) -> Void) {
        getFilmesDaApi {
            let quantidadeDeFavoritos = Int(listaDeFavoritos.count)
            let quantidadeDeFilmes = Int(self.filmes.count)
            let porcentagemFanzometro = (100 * quantidadeDeFavoritos) / quantidadeDeFilmes
            DispatchQueue.main.async {
                completion("\(porcentagemFanzometro) %")
            }
        }
    }
    
    // retorna a porcentagem de fã do usuario
    func getFanzometroDoUsuario(completion: @escaping (String) -> Void) {
        let favoritos = (try? filmeEntityService.favoritos()) ?? []
       fanzometroPorcentagem(listaDeFavoritos: favoritos, completion: completion)
    }
    
    // envia os dados do filme para a celula
    func getViewModel(posicao: Int) -> FilmeViewModel {
        let filmes = (try? filmeEntityService.favoritos()) ?? []
        let filme = filmes[posicao]
        let cellViewModel = FilmeViewModel(filme: filme)
        return cellViewModel
    }
    
    func getFilmesDaApi(completion: @escaping ()-> Void ){
        servicoDeAPI.loadFilmes { filmes in
            self.filmes = filmes
            completion()
        }
    }
}
