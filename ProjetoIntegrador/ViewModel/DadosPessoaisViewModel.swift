//
//  DadosPessoaisViewModel.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/06/16.
//

import Foundation

class DadosPessoaisViewModel {
    
    // usuario logado
    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
    
    // envia nome do usuario
    func getNomeDoUsuario() -> String {
        guard let usuarioLogado = usuarioLogado else { return "" }
        return usuarioLogado.nome
    }
    
    // envia foto do usuario
    func getFotoDoUsuario() -> String {
        guard let usuarioLogado = usuarioLogado else { return "" }
        return usuarioLogado.foto
    }
    
}
