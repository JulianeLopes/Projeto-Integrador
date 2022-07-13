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
    

    
    func getSpoiler(filme: Filme?) -> Spoiler? {
  
        
        let spoilerExist = servicoDeSpoiler.listaDeFilmesSpoiler.first { tituloDoFilmeNoSpoiler in
            tituloDoFilmeNoSpoiler.title == filme?.title
        }
        
        return spoilerExist
    }
    
    func selecionarFilme(posicao: Int){
        filmeSelecionado = getItem(row: posicao)
        spoilerFilmeSelecionado = getSpoiler(filme: filmeSelecionado)
    }
    
    
}
