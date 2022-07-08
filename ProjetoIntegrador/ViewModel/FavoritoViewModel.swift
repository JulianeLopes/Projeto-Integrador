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
    
}
