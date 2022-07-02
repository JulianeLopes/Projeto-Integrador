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
    
    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
    
    func numeroDeFilmesFavoritos() -> Int {
        return ((try? serviceCoreData.assistirMaisTarde()) ?? []).count

    }
    
    func getItem(row: Int) -> Filme {
        return ((try? serviceCoreData.assistirMaisTarde())!)[row]
    
    }
    func getCellViewModel(posicao: Int) -> FilmeViewModel {
            let filme = ((try? serviceCoreData.assistirMaisTarde())!)[posicao]
            let cellViewModel = FilmeViewModel(filme: filme)
            return cellViewModel
        }
    
}
