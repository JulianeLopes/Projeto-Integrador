//
//  NovoUsuarioViewModel.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/06/09.
//

import Foundation

//protocol NovoUsuarioViewModelDelegate {
//
//}

class NovoUsuarioViewModel {
   // var delegate: NovoUsuarioViewModelDelegate?
    
    // criando um usuário universal vazio para preencher
    var novoUsuarioCriado: Usuario = Usuario(nome: "", email: "", senha: "", foto: "", nivelDeFa: 0.0, filmesFavoritos: [])
    
    func novoUsuario(nome: String?, email: String?, senha: String?) -> Usuario {
        if let nome = nome, let email = email, let senha = senha {
            novoUsuarioCriado = Usuario(nome: nome, email: email, senha: senha, foto: "", nivelDeFa: 0.0, filmesFavoritos: [])
            return novoUsuarioCriado
        }
    
        return novoUsuarioCriado
    }
    
    func validaEmail(){
        
    }
    
    func converteTextField(email: String?, senha: String?) -> Bool {
        if let email = email, email != "" {
            if email.contains("@"){
                return true
            }else {
                return false
            }
        }
            if let senha = senha {
                if senha.count == 6 {
                    return true
                } else {
                    return false
                }
            }

        return false
    }
}
