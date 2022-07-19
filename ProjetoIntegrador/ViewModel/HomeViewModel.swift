//
//  HomeViewModel.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/05/30.
//

import Foundation
import UIKit
import CoreData

protocol HomeViewModelDelegate {
    func configuraPosterFilmeDestaque(imagem: UIImage)
}

class HomeViewModel {
    private let servicosDeAPI = MovieAPI()
    private let servicoDeSpoiler = ServicoDeSpoiler()
    
    var delegate: HomeViewModelDelegate?
    var filmeSelecionado: Filme?
    var spoiler: Spoiler?
    var filmeDestaque: Filme?
    var filmeDestaquePoster: UIImage?
    var filmes: [Filme] = []
    var filmesCoreData: [Filme] = []
    
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
        return servicosDeAPI.quantidadeDeFilmes
    }
    
    // envia dados do filme selecionado para a celula
    func getCellViewModel(posicao: Int) -> FilmeViewModel {
        let filme = servicosDeAPI.filmesFromData[posicao]
        let cellViewModel = FilmeViewModel(filme: filme)
        return cellViewModel
    }
    
    // pega o filme selecionado da lista de filmes
    func getFilme(posicao: Int) -> Filme? {
       
        let filmeSelecionado = filmes[posicao]
        return filmeSelecionado
    }
    
    func getSpoiler(filme: Filme?) -> Spoiler? {
        let spoilerExist = servicoDeSpoiler.listaDeFilmesSpoiler.first { tituloDoFilmeNoSpoiler in
               tituloDoFilmeNoSpoiler.title == filme?.title
           }
        spoiler = spoilerExist
            return spoiler
    }
    // pega o posição do filme selecionado na lista
    func selecionarFilme(posicao: Int) {
        filmeSelecionado = getFilme(posicao: posicao)
        spoiler = getSpoiler(filme: filmeSelecionado)
    }
    
    

    private func selecionarFilme(filme: Filme) {
        filmeSelecionado = filme
        
    }
    
    // envia o filme selecionado para outra tela
    func getFilmeSelecionado() -> Filme? {
        return filmeSelecionado
    }
    
    func getSpoilerFilmeSelecionado() -> Spoiler? {
        return spoiler
    }
    
    // configura o filme de destaque
    func aplicarFilmePadrao(completion: @escaping () -> Void) {
        getFilmesDaAPI {
            self.filmeDestaque = self.filmes[2]
            self.getPosterFilmeDestaqueDaApi()
            self.selecionarFilme(filme: self.filmes[2])
            completion()
        }
    }
    
    
    func getFilmesDaAPI(completion: @escaping () -> Void){
        servicosDeAPI.loadFilmes { filmes in
            self.filmes = filmes
            self.filmeDestaque = filmes[2]
            completion()
            
        }
    }
    
    func getPosterFilmeDestaqueDaApi(){
        guard let poster = filmeDestaque?.cover_url else { return }
        guard let url = URL(string: poster) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                print(data)
                let coverImagem = UIImage(data: data)
                guard let coverImagem = coverImagem else { return }
                self.delegate?.configuraPosterFilmeDestaque(imagem: coverImagem)
            }
        }
        dataTask.resume()
    }
}


