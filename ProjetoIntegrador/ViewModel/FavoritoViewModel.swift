//
//  FavoritoViewModel.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/06/08.
//

import Foundation

class FavoritoViewModel {
    
    let service = ServicoDeUsuario()
    let serviceCoreData = FilmeEntityService()
    let servicoDeSpoiler = ServicoDeSpoiler()
    
    var filmeSelecionado: Filme?
    var spoilerFilmeSelecionado: Spoiler?
    
    
    func atualizaView(){
        
    }
    
    var filmes: [Filme] {
        try! serviceCoreData.assistirMaisTarde()
    }
    
    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
    
    func numeroDeFilmesFavoritos() -> Int {
        return filmes.count

    }
    
    func getItem(row: Int) -> Filme {
        return filmes[row]
    
    }
    
    func getCellViewModel(posicao: Int) -> FilmeViewModel {
        let filme = filmes[posicao]
        let cellViewModel = FilmeViewModel(filme: filme)
        return cellViewModel
    }
    
    func getSpoiler(posicao: Int) -> Spoiler {
        let spoilerDoFilme = servicoDeSpoiler.listaDeFilmesSpoiler[posicao]
        return spoilerDoFilme
    }
    
    func selecionarFilme(posicao: Int){
        spoilerFilmeSelecionado = getSpoiler(posicao: posicao)
        filmeSelecionado = getItem(row: posicao)
    }
    
    
}
