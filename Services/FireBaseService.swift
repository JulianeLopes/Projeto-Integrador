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
import FirebaseDatabase
import FirebaseStorage

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
    
    
    // encontrando o usuario no database
    func fetchUser(uid: String, completion: @escaping (UsuarioFirebase)->Void) {
        usersREF.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dicionario = snapshot.value as? [String: AnyObject] else { return }
            let user = UsuarioFirebase(uid: uid, dicionario: dicionario)
            completion(user)
        }
    }
    
    func fetchUserFoto(uid: String, completion: @escaping (UsuarioFirebase)->Void) {
        usersREF.child(uid).observe(.value) { snapshot in
            guard let dicionario = snapshot.value as? [String: AnyObject] else { return }
            let user = UsuarioFirebase(uid: uid, dicionario: dicionario)
            completion(user)
        }
    }
    
    // salvando o usuario logado pelo facebook no database
    
    func salvarUsuarioNoDataBase(user: User){
        let fileName = NSUUID().uuidString
        let storageReference = storageProfileImages.child(fileName)
        guard let profileImageData = user.photoURL?.dataRepresentation, let profileImageUrlString = user.photoURL?.absoluteString else { return }
        
        storageReference.putData(profileImageData, metadata: nil) { meta, error in
            if let error = error {
                print("erro ao salvar imagem do usuario no database \(error.localizedDescription)")
            }
        }
        
        let uid = user.uid
        guard let nome = user.displayName, let email = user.email else { return }
        
        let valores = ["email": email,
                       "nome": nome,
                       "foto": profileImageUrlString]
        
        usersREF.child(uid).updateChildValues(valores) { error, databaseReference in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    // atualizando dados no database
    func atualizarDadosDoUsuarioNoDatabase(user: User, nome: String, foto: UIImage?, email: String?, completion: @escaping ()-> Void){
        guard let profileImageData = foto?.jpegData(compressionQuality: 0.3) else { return }
        
        
        let fileName = NSUUID().uuidString
        let storageReference = storageProfileImages.child(fileName)
        
        storageReference.putData(profileImageData, metadata: nil) { meta, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            storageReference.downloadURL { url, error in
                guard let email = email else {
                    
                    return
                }

                var valores: [String: String] = [
                    "email": email
                ]
                
                if let urlString = url?.absoluteString {
                    valores["foto"] = urlString
                }
                
                usersREF.child(user.uid).updateChildValues(valores) { error, databaseReference in
                    if let error = error {
                        print(error)
                    }
                    completion()
                }
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
    
    
    func redefinirSenha(senha: String, completion: @escaping (Error?) -> Void){
        Auth.auth().currentUser?.updatePassword(to: senha, completion: { error in
            completion(error)
        })
    }
    
    func redefinirEmail(email: String, completion: @escaping (Error?) -> Void){
        Auth.auth().currentUser?.updateEmail(to: email, completion: { error in
            completion(error)
        })
    }
    
}


