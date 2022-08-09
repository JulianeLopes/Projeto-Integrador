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
    func snackBarAssistido()
    func snackBarAssistirMaisTarde()
    func snackBarFilmeAssistido()
    func avaliaFilmeZero()
    func avaliaFilmeUm()
    func avaliaFilmeDois()
    func avaliaFilmeTres()
    func avaliaFilmeQuatro()
    func avaliaFilmeCinco()
}


class DetalheDoFilmeViewModel {
    var servicoDeApi = MovieAPI()
    var spoiler = ServicoDeSpoiler()
    var listaDefavoritos: [Filme] = []
    var listaDeFilmesAssistidos: [String] = []
    var listaParaAssistirMaisTarde: [Filme] = []
    var listaDeFilmesApi: [Filme] = []
    var listaDeFilmesAvaliados: [String: Int] = [:]
    var servicoUserDefault = UserDefaultsService.shared
    var servicoCoreData = ServiceCoreData()
    
    var filme: Filme?
    var spoilerFilme: Spoiler?
    
    var delegate: FilmesViewModelDelegate?
    
    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
    
    private var usuarioLogadoEntities: UsuarioEntities? {
        return SessionManager.shared.usuarioEntities
    }
    
    
    
    // MARK: - Botão Favoritar
    var favoritos: [Filme] {
        return usuarioLogadoEntities?.listaDeFilmesFavoritos ?? []
    }
    
    var isFavorite: Bool {
        return favoritos.contains { favorito in
            return favorito.title == filme?.title
        }
    }
    
    func loadFavoritos() {
        guard let listaDeFavoritosUsuario = usuarioLogadoEntities?.wrappedFilmesentities else { return }
        do {
            listaDefavoritos = try servicoCoreData.favoritos(favoritos: listaDeFavoritosUsuario)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // função de favoritar filmes e salvar no coredata
    func favorita(filme: Filme?){
        guard let filme = filme else { return }
        
        let exists = favoritos.contains { favorito in
            
            return favorito.title == filme.title
        }
        
       // guard let usuario = SessionManager.shared.returnUsuarioEntities() else { return }
        guard let usuario = usuarioLogadoEntities else { return }
        if exists {
            try? servicoCoreData.removerFilmesDosFavoritos(usuario: usuario, filme: filme)
            delegate?.snackBarDesfavoritado()
            loadFavoritos()
        } else {
            do {
                try servicoCoreData.adicionarFilmesAosFavoritos(usuario: usuario, filme: filme)
                delegate?.snackBarFavoritado()
                loadFavoritos()
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
    
    
    // MARK: - Botão assistir mais tarde
    var assistirMaisTarde: [Filme] {
        return usuarioLogadoEntities?.listaDeFilmesAssistirDepois ?? []
    }
    
    var isParaAssitir: Bool {
        return assistirMaisTarde.contains { filmeAssistido in
            return filmeAssistido.title == filme?.title
        }
    }
    
    func loadAssistirMaisTarde() {
        guard let listaAssistirMaisTarde = usuarioLogadoEntities?.wrappedFilmesParaAssistir else { return }
        do {
            listaParaAssistirMaisTarde = try servicoCoreData.assistirMaisTarde(lista: listaAssistirMaisTarde)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // função de adicionar filmes assistir mais tarde
    func assistirMaisTarde(filme: Filme?){
        guard let filme = filme else { return }
        
        let exists = assistirMaisTarde.contains { filmeAssistido in
            
            return filmeAssistido.title == filme.title
        }
        
        guard let usuario = usuarioLogadoEntities else { return }
        if exists {
            try? servicoCoreData.removerAssistirMaisTarde(usuario: usuario, filme: filme)
            delegate?.snackBarAssistido()
            loadAssistirMaisTarde()
        } else {
            do {
                try? servicoCoreData.adicionarFilmesAssistir(usuario: usuario, filme: filme)
                delegate?.snackBarAssistirMaisTarde()
                loadAssistirMaisTarde()
            } catch {
                print(error)
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
    
    // MARK: - Botão Assitido
    var assistidos: [String] {
        return servicoUserDefault.loadDefaults()
    }
    
    var isAssistido: Bool {
        return assistidos.contains { assistido in
            return assistido == filme?.title
        }
    }
    
    func loadFilmesAssistidos(){
        listaDeFilmesAssistidos = servicoUserDefault.loadDefaults()
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
            delegate?.snackBarFilmeAssistido()
            servicoUserDefault.addNovoNome(filme.title!)
            loadFilmesAssistidos()
            
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
    
    // MARK: - API
    
    func getPoster(filme: Filme?, completion: @escaping (UIImage?) -> Void) {
        servicoDeApi.getPosterFilmeDestaqueDaApi(url: filme?.cover_url, completion: completion)
    }
    
    func getFilmesApi(completion: @escaping()->Void){
        servicoDeApi.loadFilmes { filmes in
            self.listaDeFilmesApi = filmes
            completion()
        }
    }
    
    //MARK: - Collection View de indicações de filmes
    
    func getQuantidadeDeFilmesIndicados() -> Int {
        guard let spoilerFilme = spoilerFilme else { return 0 }
        return getFilmesIndicados(spoilerDoFilme: spoilerFilme).count
    }
    
    private func getFilmesIndicados(spoilerDoFilme: Spoiler) -> [Filme] {
        var filmes: [Filme] = []
        
        for filme in listaDeFilmesApi {
            let filmeEIndicado = spoilerDoFilme.filmesParaAssistirAntes.contains { filmeTitulo in
                filme.title == filmeTitulo
            }
            if filmeEIndicado {
                filmes.append(filme)
            }
        }
        return filmes.reversed()
    }
    
    func getCellViewModel(posicao: Int) -> FilmeViewModel {
        
        let filme = getFilmesIndicados(spoilerDoFilme: spoilerFilme!)[posicao]
        let cellViewModel = FilmeViewModel(filme: filme)
        return cellViewModel
    }
    
    //MARK: - avaliação de filmes salvando no userdefaults
    
    var avaliados: [String: Int]{
        return servicoUserDefault.loadAvaliacao()
    }
    
    var foiAvaliado: Bool {
        listaDeFilmesAvaliados.contains { (titulo, avaliacao) in
            filme?.title == titulo
        }
    }
    
    func loadAvaliados(){
        listaDeFilmesAvaliados = servicoUserDefault.loadAvaliacao()
    }
    
    
    func avaliaFilme(filme: Filme?, avaliacao: Int) {
        guard let filme = filme else { return }
        
        servicoUserDefault.addNovaAvaliacao(titulo: filme.title!, avaliacao: avaliacao)
        getButtonAvalicao(avaliacao: avaliacao)
    }
    
    func getButtonAvalicao(avaliacao: Int){
        switch avaliacao {
        case 0:
            delegate?.avaliaFilmeZero()
        case 1:
            delegate?.avaliaFilmeUm()
        case 2:
            delegate?.avaliaFilmeDois()
        case 3:
            delegate?.avaliaFilmeTres()
        case 4:
            delegate?.avaliaFilmeQuatro()
        case 5:
            delegate?.avaliaFilmeCinco()
        default:
            break
        }
    }
    
    func getAvaliacao(){
        guard let filme = filme else { return }
        
        let avaliado = listaDeFilmesAvaliados.first { $0.key.contains(filme.title!)
        }
        guard let avaliado = avaliado else { return }
        
        getButtonAvalicao(avaliacao: avaliado.value)
    }
    
}
