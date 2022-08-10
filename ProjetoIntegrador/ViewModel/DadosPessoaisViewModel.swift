//
//  DadosPessoaisViewModel.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/06/16.
//

import Foundation
import UIKit
import FirebaseAuth

protocol DadosPessoaisDelegate {
    func erroAoAtualizarSenha()
    func sucessoAoAtualizarSenha()
    func erroAoAtualizarEmail()
    func sucessoAoAtualizarEmail()
}

class DadosPessoaisViewModel {
    
    var coredataService = ServiceCoreData()
    var firebaseService = FireBaseService()
    var delegate: DadosPessoaisDelegate?
    
    // usuario logado
    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
    
    private var usuarioLogadoEntities: UsuarioEntities? {
        return SessionManager.shared.usuarioEntities
    }
    
    // envia nome do usuario
    func getNomeDoUsuario() -> String {
        guard let usuarioLogado = usuarioLogado else { return "" }
        return usuarioLogado.nome
    }
    
    // envia foto do usuario
    func getFotoDoUsuario() -> UIImage? {
        return usuarioLogadoEntities?.wrappedFoto
    }
    
    func getEmailDoUsuario() -> String {
        guard let email = usuarioLogadoEntities?.wrappedEmail else { return ""}
        return email
    }
    
    func mudarDadosPessoais(email: String?, senha: String?, foto: UIImage?) {
        if let user = Auth.auth().currentUser {
            
            firebaseService.fetchUser(uid: user.uid) { userBF in
                let nome = userBF.nome
                let fotoData = foto?.jpegData(compressionQuality: 0.3)
                
                
                if let senha = senha {
                    self.firebaseService.redefinirSenha(senha: senha) { error in
                        if let error = error {
                            print(error.localizedDescription)
                            self.delegate?.erroAoAtualizarSenha()
                        } else {
                            if let email = email {
                                self.firebaseService.redefinirEmail(email: email) { error in
                                    if let error = error {
                                        print(error.localizedDescription)
                                        self.delegate?.erroAoAtualizarEmail()
                                    } else {
                                        self.firebaseService.atualizarDadosDoUsuarioNoDatabase(user: user, nome: nome, foto: foto, email: email) {
                                            self.coredataService.saveUsuario(nome: nome, emailCadastrado: userBF.email, emailNovo: email, foto: fotoData)
                                            self.delegate?.sucessoAoAtualizarEmail()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
