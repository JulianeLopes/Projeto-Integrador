//
//  NovoUsuarioViewModel.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/06/09.
//

import Foundation

protocol NovoUsuarioViewModelDelegate {
    func alertaDadosDeCadastroIncorretos()
    
}

class NovoUsuarioViewModel {
   var delegate: NovoUsuarioViewModelDelegate?
    
    // criando um usuário universal vazio para preencher
    var novoUsuarioCriado: Usuario = Usuario(nome: "", email: "", senha: "", foto: "", nivelDeFa: 0.0, filmesFavoritos: [])
    
    func novoUsuario(nome: String?, email: String?, senha: String?) -> Usuario {
        if let nome = nome, let email = email, let senha = senha {
            if email.contains("@") && senha.count == 6 {
                    novoUsuarioCriado = Usuario(nome: nome, email: email, senha: senha, foto: "", nivelDeFa: 0.0, filmesFavoritos: [])
                    return novoUsuarioCriado
            }
        }
        // alertar o usuário que os dados estão incorretos
        delegate?.alertaDadosDeCadastroIncorretos()
        return novoUsuarioCriado
    }
}
