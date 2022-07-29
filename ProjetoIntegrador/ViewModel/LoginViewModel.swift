//
//  LoginViewModel.swift
//  ProjetoIntegrador
//
//  Created by Juliane Lopes Moreira Rodrigues on 02/06/22.
//

import Foundation
import FirebaseCore
import GoogleSignIn
import FirebaseAuth
import FacebookCore
import FacebookLogin

protocol LoginViewModelDelegate {
    func apresentaAlerta()
    func segue()
}
class LoginViewModel {
    
    var delegate: LoginViewModelDelegate?
    var usuarioEnviado: Usuario?
    var fireBaseService = FireBaseService()
    var usuarioGoogle: GIDGoogleUser?
    var usuario: User?
    var servicoCoreData = ServiceCoreData()
    let sessionManager = SessionManager.shared
    
    // função para conferir se o usuário existe na base
    func confereUsuario(usuarioDig: String?, senhaDigitada: String?) -> Bool {
        var isSameUsuario: Bool = false
        
        for usuario in ServicoDeUsuario.listaDeUsuario {
            if usuarioDig == usuario.email && senhaDigitada == usuario.senha {
                    usuarioEnviado = usuario
                    isSameUsuario = true
            }
        }
        return isSameUsuario
    }
    
    // se o usuário existe é direcionado para outra tela atraves do delegate
    func mudarDeTela(usuario: Bool){
        if usuario == true {
            SessionManager.shared.usuarioLogado = usuarioEnviado
            delegate?.segue()
        } else {
            delegate?.apresentaAlerta()
        }
    }
    
    func loginGoogle(presenter: UIViewController) {
        fireBaseService.loginGoogle(presenter: presenter) { usuario in
            self.usuarioGoogle = usuario
            guard let nome = usuario?.profile?.name, let email = usuario?.profile?.email else { return }
            
            self.servicoCoreData.saveUsuario(nome: nome, email: email, foto: usuario?.profile?.imageURL(withDimension: 150)?.absoluteString)
            do {
                let usuario = try self.servicoCoreData.getUsuario(email: email)?.converterParaUsuario()
                self.sessionManager.usuarioLogado = usuario
                self.delegate?.segue()
            } catch {
                print(error)
            }
        }
        
    }
    
    func tratarLoginFacebook(result: LoginManagerLoginResult?, error: Error?){
        
        fireBaseService.tratarLoginFacebook(result: result, error: error) { userLogadoFace in
            self.usuario = userLogadoFace
            
            guard let nome = userLogadoFace.displayName, let email = userLogadoFace.email else { return }
            
            self.servicoCoreData.saveUsuario(nome: nome, email: email, foto: userLogadoFace.photoURL?.absoluteString)
            do {
                let usuario = try self.servicoCoreData.getUsuario(email: email)?.converterParaUsuario()
                self.sessionManager.usuarioLogado = usuario
                self.delegate?.segue()
            } catch {
                print(error)
            }
            
        }
        
    }
//    func verifyUser(email: String?, password: String?){
//            guard let email = email, let password = password else { return }
//
//            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
//                if let error = error {
//                    print(error.localizedDescription)
//                    self.delegate?.apresentaAlerta()
//                } else {
//                    self.delegate?.segue()
//                    do {
//                        guard let nome = Auth.auth().currentUser?.displayName,
//                        let  email = Auth.auth().currentUser?.email,
//                        let foto = Auth.auth().currentUser?.photoURL?.absoluteString else { return }
//                        self.servicoCoreData.saveUsuario(nome: nome, email: email, foto: foto)
//
//                        let usuarioLogado = try self.servicoCoreData.getUsuario(email: email)?.converterParaUsuario()
//                        self.sessionManager.usuarioLogado = usuarioLogado
//
//                    } catch {
//                        print(error)
//                    }
//
//                }
//            }
//        }
    func verifyUser(email: String?, password: String?){
        fireBaseService.tratarLoginEmailSenha(email: email, senha: password) { user in
            self.usuario = user
            
            guard let nome = user?.displayName, let email = user?.email else { return }
            
            self.servicoCoreData.saveUsuario(nome: nome, email: email, foto: user?.photoURL?.absoluteString)
            do {
                let usuario = try self.servicoCoreData.getUsuario(email: email)?.converterParaUsuario()
                self.sessionManager.usuarioLogado = usuario
                self.delegate?.segue()
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
    
   
    
}



