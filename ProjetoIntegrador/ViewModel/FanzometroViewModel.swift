//
//  FanzometroViewModel.swift
//  ProjetoIntegrador
//
//  Created by Giselle Andrade on 29/05/22.
//

import Foundation

class FanzometroViewModel {
    
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
