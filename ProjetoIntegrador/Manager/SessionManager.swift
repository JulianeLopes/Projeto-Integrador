//
//  SessionMenager.swift
//  ProjetoIntegrador
//
//  Created by Gui  on 07/06/22.
//

import Foundation
import FirebaseAuth

class SessionManager {
    private let firebaseService = FireBaseService()
    private let servicoCoreData = ServiceCoreData()
    
    static var shared = SessionManager()
    var usuarioLogado: Usuario?
    
    func fetchUsuario(completion: @escaping (Error?)->Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        firebaseService.fetchUser(uid: uid) { usuarioFirebase in
            do {
                let usuario = try self.servicoCoreData.getUsuario(email: usuarioFirebase.email)?.converterParaUsuario()
                self.usuarioLogado = usuario
                completion(nil)
            } catch {
                print(error.localizedDescription)
                completion(error)
            }
        }
    }
    
    func returnUsuarioEntities() -> UsuarioEntities? {
        var usuario: UsuarioEntities?
        guard let email =  usuarioLogado?.email else {return nil}
        do {
        usuario = try servicoCoreData.getUsuario(email: email)
        } catch {
            print(error)
        }
        return usuario
    }
}
