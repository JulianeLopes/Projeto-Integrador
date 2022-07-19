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
    var servicoCoreData = ServiceCoreData()
    
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
        }
    }
    
    func tratarLoginFacebook(result: LoginManagerLoginResult?, error: Error?){
            
            fireBaseService.tratarLoginFacebook(result: result, error: error)
        }
    
    func verifyUser(email: String?, password: String?){
            guard let email = email, let password = password else { return }
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    print(error.localizedDescription)
                    self.delegate?.apresentaAlerta()
                } else {
                    self.delegate?.segue()
                    self.getUsuario(email: email, password: password)
                }
            }
        }
    
    private var usuarios: [UsuarioEntities] {
        try! servicoCoreData.fetchUsuario()
    }
    
    func getUsuario(email: String, password: String) -> UsuarioEntities? {
        if let usuario = usuarios.first(where: {
            return $0.email == email && $0.senha == password
        }) {
            return usuario
        }
        return nil
    }
    
    
    
}



