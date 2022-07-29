//
//  FireBaseService.swift
//  ProjetoIntegrador
//
//  Created by Fernanda Perovano on 13/07/22.
//

import Foundation
import UIKit
import FirebaseCore
import GoogleSignIn
import FirebaseAuth
import FacebookCore
import FacebookLogin
import FBSDKLoginKit

class FireBaseService {
    
    //MARK: Login com o google
    func loginGoogle(presenter: UIViewController, completion: @escaping (GIDGoogleUser?) -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: presenter) { [unowned self] user, error in
            if let error = error {
                print(error)
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print(error)
                }
                completion(user)
                return
            }
        }
    }
    
    
    // MARK: Login com o facebook
    func tratarLoginFacebook(result: LoginManagerLoginResult?, error: Error?, completion: @escaping (User) -> Void) {
        switch result {
            
        case .none:
            print("erro no login")
        case .some(let loginResult):
            guard let token = loginResult.token?.tokenString else { return }
            
            let credential = pegarConfiguracaoFacebook(token: token)
            salvarNoFireBase(com: credential)
            pegarUsuario(credential: credential) { user in
                completion(user)
            }
        }
    }
    
    // salvar nome e foto no Database do firebase
    func tratarLoginEmailSenha(email: String?, senha: String?, completion: @escaping (User?)->Void){
        guard let email = email, let senha = senha else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: senha) { result, error in
            if let error = error{
                print(error)
            }
            let user = result?.user
            completion(user)
        }
    }
    
    func pegarConfiguracaoFacebook(token: String) -> AuthCredential {
        return FacebookAuthProvider.credential(withAccessToken: token)
    }
    
    func pegarUsuario(credential: AuthCredential, completion:@escaping (User) -> Void) {
        Auth.auth().signIn(with: credential) { result, error in
            guard let user = result?.user else { return }
            completion(user)
        }
    }
    
    // MARK: Salvando no Firebase
    func salvarNoFireBase(com credential: AuthCredential){
        Auth.auth().signIn(with: credential) { AuthResult, error in
            if let error = error {
                print(error)
            }
            return
            
        }
    }
    
    //MARK: - Logout
    
    func logOut(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            AccessToken.current = nil
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    
}


