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
//    func confereUsuario(usuarioDig: String?, senhaDigitada: String?) -> Bool {
//        var isSameUsuario: Bool = false
//        
//        for usuario in ServicoDeUsuario.listaDeUsuario {
//            if usuarioDig == usuario.email && senhaDigitada == usuario.senha {
//                    usuarioEnviado = usuario
//                    isSameUsuario = true
//            }
//        }
//        return isSameUsuario
//    }
    
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
            
            
            // salvando no database
            Auth.auth().addStateDidChangeListener { auth , user in
                guard let user = user else { return }
                self.fireBaseService.salvarUsuarioNoDataBase(user: user)
            }
            let imageURL = usuario?.profile?.imageURL(withDimension: 150)
//            var imageData: Foundation.Data?
//
//            if  let imageURL = imageURL,
//                let data = try? Foundation.Data(contentsOf: imageURL){
//                imageData = data
//            }
            let imageData = self.converteImagemPraData(imageUrl: imageURL)
            
            self.servicoCoreData.saveUsuario(nome: nome, email: email, foto: imageData)
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
            
            Auth.auth().addStateDidChangeListener { auth , user in
                guard let user = user else { return }
                self.fireBaseService.salvarUsuarioNoDataBase(user: user)
                let imageURL = user.photoURL
                let imageData = self.converteImagemPraData(imageUrl: imageURL)
                let uid = userLogadoFace.uid
                
                self.fireBaseService.salvarUsuarioNoDataBase(user: userLogadoFace)
                
                self.fireBaseService.fetchUser(uid: uid) { usuarioFirebase in
                    let nome = usuarioFirebase.nome
                    let email = usuarioFirebase.email
                    self.servicoCoreData.saveUsuario(nome: nome, email: email, foto: imageData)
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
        
    }
    
    func verifyUser(email: String?, password: String?){
        fireBaseService.tratarLoginEmailSenha(email: email, senha: password) { user in
            guard let uid = user?.uid else { return }
            self.usuario = user
            
            self.fireBaseService.fetchUser(uid: uid) { usuarioFirebase in
                let nome = usuarioFirebase.nome
                let email = usuarioFirebase.email
                let imageURL = usuarioFirebase.foto
                let imageData = self.converteImagemPraData(imageUrl: imageURL)
                self.servicoCoreData.saveUsuario(nome: nome, email: email, foto: imageData)
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
    
    func converteImagemPraData(imageUrl: URL?) -> Foundation.Data? {
        var imageData: Foundation.Data?
        
        if  let imageURL = imageUrl,
            let data = try? Foundation.Data(contentsOf: imageURL){
            imageData = data
        }
        return imageData
    }
}



