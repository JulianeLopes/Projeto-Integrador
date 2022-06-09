//
//  LoginViewModel.swift
//  ProjetoIntegrador
//
//  Created by Juliane Lopes Moreira Rodrigues on 02/06/22.
//

import Foundation

protocol LoginViewModelDelegate {
    func apresentaAlerta()
    func segue()
}
class LoginViewModel {
    
    var delegate: LoginViewModelDelegate?
    var usuarioEnviado: Usuario?
    
    func confereUsuario(usuarioDig: String?, senhaDigitada: String?) -> Bool {
        var isSameUsuario: Bool = false
        
        for usuario in ServicoDeUsuario.listaDeUsuario{
            if usuarioDig == usuario.email {
                if senhaDigitada == usuario.senha {
                      usuarioEnviado = usuario
                    isSameUsuario = true
                }
            }
        }
        
        return isSameUsuario
    }
    
    func mudarDeTela(usuario: Bool){
        if usuario == true {
            SessionManager.shared.usuarioLogado = usuarioEnviado
            delegate?.segue()
        } else {
            delegate?.apresentaAlerta()
        }
    }
    
//    func converteTextField(email: String?, senha: String?) -> Bool {
//        if let email = email, email != "" {
//            if email.contains("@"){
//                return true
//            }else {
//                return false
//            }
//        }
//            if let senha = senha {
//                if senha.count == 6 {
//                    return true
//                } else {
//                    return false
//                }
//            }
//
//        return false
//    }
}



