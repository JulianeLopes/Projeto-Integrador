//
//  FanzometroViewModel.swift
//  ProjetoIntegrador
//
//  Created by Giselle Andrade on 29/05/22.
//

import Foundation

class FanzometroViewModel {
    let service = ServicoDeUsuario()
    
    func numeroDeFilmesFavoritos() -> Int {
        return ServicoDeUsuario.user.filmesFavoritos.count
    }
}
