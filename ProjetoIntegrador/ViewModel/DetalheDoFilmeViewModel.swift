//
//  DetalheDoFilmeViewModel.swift
//  ProjetoIntegrador
//
//  Created by Fernanda Perovano on 12/06/22.
//

import Foundation
import UIKit

protocol FilmesViewModelDelegate {
    func atualizaButtonFavoritado()
    func atualizaButtonDesfavoritado()
    func atualizaButtonAssistido()
    func atualizaButtonParaAssistir()
    func atualizaButtonFilmeJaAssistido()
    func atualizaButtonFilmeAssistir()
    func snackBarDesfavoritado()
    func snackBarFavoritado()
    

}


class DetalheDoFilmeViewModel {
    var servicoDeApi = MovieAPI()
    var spoiler = ServicoDeSpoiler()
    var listaDefavoritos: [Filme] = []
    var listaParaAssistirMaisTarde: [Filme] = []
    var servicoUserDefault = UserDefaultsService.shared
    var assistidos:[String] = []
    
    var filme: Filme?
    
    var delegate: FilmesViewModelDelegate?
    
    var favoritos: [Filme] {
        return (try? filmeEntityService.favoritos()) ?? []
    }
    
    var assistirMaisTarde: [Filme] {
        return (try? filmeEntityService.assistirMaisTarde()) ?? []
    }
    
    var isFavorite: Bool {
        return favoritos.contains { favorito in
            return favorito.title == filme?.title
        }
    }
    
    var isAssistido: Bool {
        return assistidos.contains { assistido in
            return assistido == filme?.title
        }
    }
    
    var isParaAssitir: Bool {
        return assistirMaisTarde.contains { filmeAssistido in
            return filmeAssistido.title == filme?.title
        }
    }
    
    func verificaSeEFavorito()->Bool {
        favoritos.contains { favorito in
            favorito.title == filme?.title
        }
    }
    
    func loadFavoritos(){
        do {
        try listaDefavoritos = filmeEntityService.favoritos()
        } catch {
            print(error)
        }
    }
    
    func loadAssistirMaisTarde(){
        do {
        try listaParaAssistirMaisTarde = filmeEntityService.assistirMaisTarde()
        } catch {
            print(error)
        }
    }
    
    private let filmeEntityService = FilmeEntityService()
    private lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // usuario logado
    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
    
    func getPoster(filme: Filme?, completion: @escaping (UIImage?) -> Void) {
        servicoDeApi.getPosterFilmeDestaqueDaApi(url: filme?.cover_url, completion: completion)
        
    }

    // função de favoritar filmes e salvar no coredata
    func favorita(filme: Filme?){
        guard let filme = filme else { return }
        
        let exists = favoritos.contains { favorito in
            
            return favorito.title == filme.title
        }
        
        if exists {
            try? filmeEntityService.remove(filme: filme)
            delegate?.snackBarDesfavoritado()
            loadFavoritos()
       } else {
            do {
                try filmeEntityService.favoritar(filme: filme)
                delegate?.snackBarFavoritado()
                loadFavoritos()
            } catch {
                print(error)
            }
        }
    }
    
    // função de adicionar filmes assistir mais tarde
    func assistirMaisTarde(filme: Filme?){
        guard let filme = filme else { return }
        
        let exists = assistirMaisTarde.contains { filmeAssistido in
            
            return filmeAssistido.title == filme.title
        }
        
        if exists {
            try? filmeEntityService.removeFilmeAssistido(filme: filme)
            loadAssistirMaisTarde()
       } else {
            do {
                try filmeEntityService.assistirMaisTarde(filme: filme)
                loadAssistirMaisTarde()
            } catch {
                print(error)
            }
        }
    }
    
    func getFavoritoButtonTitle() {
        if isFavorite {
            DispatchQueue.main.async {
                self.delegate?.atualizaButtonFavoritado()
            }
        } else {
            DispatchQueue.main.async {
                self.delegate?.atualizaButtonDesfavoritado()
            }
        }
    }
    
    func getFilmesParaAssistirButtonTitle() {
        if isParaAssitir {
            DispatchQueue.main.async {
                self.delegate?.atualizaButtonAssistido()
            }
        } else {
            DispatchQueue.main.async {
                self.delegate?.atualizaButtonParaAssistir()
            }
        }
    }
    
    func getFilmesAssistidosButtonTitle() {
        if isAssistido {
            DispatchQueue.main.async {
                self.delegate?.atualizaButtonFilmeJaAssistido()
            }
        } else {
            DispatchQueue.main.async {
                self.delegate?.atualizaButtonFilmeAssistir()
            }
        }
    }
    
    func loadFilmesAssistidos(){
        servicoUserDefault.loadDefaults { listaDeAssistidos in
            self.assistidos = listaDeAssistidos
            
        }
    }
    
    func assistido(filme: Filme?){
        
        guard let filme = filme else { return }
        
        let exists = assistidos.contains { filmeAssistido in
            
            return filmeAssistido == filme.title
        }
        
        if exists {
            
            delegate?.atualizaButtonFilmeJaAssistido()
            loadFilmesAssistidos()
        } else {
            delegate?.atualizaButtonFilmeAssistir()
            servicoUserDefault.addNovoNome(filme.title!)
            loadFilmesAssistidos()
            
        }
    }
    
    
}
