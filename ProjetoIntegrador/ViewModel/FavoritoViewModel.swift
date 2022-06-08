//
//  FavoritoViewModel.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/06/08.
//

import Foundation

class FavoritoViewModel {
    

    let service = ServicoDeUsuario()
    
    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
    
    func numeroDeFilmesFavoritos() -> Int {
        return usuarioLogado?.filmesFavoritos.count ?? 0

    }
    
    func getItem(row: Int) -> Filme {
        return (usuarioLogado?.filmesFavoritos[row])!
        
    }
    
}
