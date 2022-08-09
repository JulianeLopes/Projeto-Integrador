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
    let userDefaults = UserDefaultsService()
    
    var quantidadeDeFilmes: Int?
    var porcentagem: String = ""
    var filmes: [Filme] = []
    var sessionManager = SessionManager()
    
    // usuario logado
    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
    private var usuarioLogadoEntities: UsuarioEntities? {
        return SessionManager.shared.usuarioEntities
    }
    
    // quantidade filmes favoritos do usuario
    func numeroDeFilmesFavoritos() -> Int {
        return usuarioLogadoEntities?.listaDeFilmesFavoritos.count ?? 0
    }
    
    // recebe a foto do usuario
    func getFotoUsuario() -> UIImage? {
        return usuarioLogadoEntities?.wrappedFoto
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
        let favoritos = usuarioLogadoEntities?.listaDeFilmesFavoritos ?? []
       fanzometroPorcentagem(listaDeFavoritos: favoritos, completion: completion)
    }
    
    
    // calcula o nivel de fanzometro int
    public func fanzometroPorcentagemDouble(completion: @escaping (Int) -> Void) {
        getFilmesDaApi {
            
            self.servicoDeAPI.loadFilmes { listaFilmeAPI in
            self.quantidadeDeFilmes = listaFilmeAPI.count
            }
            
            let quantidadeDeAssistidos: Int = self.userDefaults.loadDefaults().count
            
            guard let quantidadeDeFilmes = self.quantidadeDeFilmes else {
                return
            }
            let porcentagemFanzometro = Int((100 * quantidadeDeAssistidos) / quantidadeDeFilmes)
                completion(porcentagemFanzometro)
        }
    }
    
    
    // envia os dados do filme para a celula
    func getViewModel(posicao: Int) -> FilmeViewModel {
        let filmes = usuarioLogadoEntities?.listaDeFilmesFavoritos ?? []
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
