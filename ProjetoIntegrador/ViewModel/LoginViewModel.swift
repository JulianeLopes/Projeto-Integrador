//
//  LoginViewModel.swift
//  ProjetoIntegrador
//
//  Created by Juliane Lopes Moreira Rodrigues on 02/06/22.
//

import Foundation

protocol LoginViewModelDelegate {
    func getDados()
}
class LoginViewModel {
    
    var delegate: LoginViewModelDelegate?
    // pegar string ? da textfield e transformar para string concreta
    
    
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






// array usuario para testar e verificar se existe o usuario
// se nao tiver aparecer borda vermelho
// email tem que conter @
// verificar se a senha contem 6 caracteres



