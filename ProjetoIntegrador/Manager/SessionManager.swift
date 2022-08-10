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
    
    //MARK: - propriedades publicas
    
    static var shared = SessionManager()
    
    var usuarioLogado: Usuario?
    
    var usuarioEntities: UsuarioEntities? {
        returnUsuarioEntities()
    }
    
    // MARK: - metodos publicos
    
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
    
    func fetchFotoUsuario() -> UIImage? {
        var foto: UIImage?
        if let uid = Auth.auth().currentUser?.uid {
            firebaseService.fetchUserFoto(uid: uid) { userFirebase in
                if let fotoData = userFirebase.foto?.dataRepresentation {
                    let fotoUsuario = UIImage(data: fotoData)
                    foto = fotoUsuario
                }
            }
        }
        return foto
    }
    
    //MARK: - metodos privados
    
    private func returnUsuarioEntities() -> UsuarioEntities? {
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
