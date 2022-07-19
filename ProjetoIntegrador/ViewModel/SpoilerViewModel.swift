//
//  SpoilerViewModel.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/07/01.
//

import Foundation

class SpoilerViewModel {
    
    var filme: Filme?
    var spoiler: Spoiler?
    
    
    func getTextSpoiler() -> String {
        guard let spoiler = spoiler?.spoiler else { return "" }
        return spoiler
    }
    
    func getTextDescricaoSpoiler() -> String {
        guard let descricao = spoiler?.descricaoCenasPosCreditos else { return "" }
        return descricao
    }
    
    func getQuantidadeDeCenasPosCredito() -> Int {
        guard let quantidade = filme?.post_credit_scenes else { return 0 }
        return quantidade
    }
}
