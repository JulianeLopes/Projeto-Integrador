//
//  NovoUsuarioViewModel.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/06/09.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage


protocol NovoUsuarioViewModelDelegate {
    func alertaDadosDeCadastroIncorretos()
    
    func usuarioCadastrado()
    
}

class NovoUsuarioViewModel {

    var delegate: NovoUsuarioViewModelDelegate?
    var serviceCoreData: ServiceCoreData = .init()
    
    let sessionManager = SessionManager.shared
    
    
    
    func registrarUsuario(email: String?, senha: String?, nome: String?){
        guard let email = email, let senha = senha, let nome = nome else { return }
        Auth.auth().createUser(withEmail: email, password: senha) { authResult, error in
            
            if let error = error {
                self.delegate?.alertaDadosDeCadastroIncorretos()
                print(error.localizedDescription)
            } else {
                self.serviceCoreData.saveUsuario(nome: nome, email: email, foto: "")
                do {
                    let usuarioLogado = try self.serviceCoreData.getUsuario(email: email)?.converterParaUsuario()
                    self.sessionManager.usuarioLogado = usuarioLogado
                    
                    
                } catch {
                    print(error)
                }
                self.delegate?.usuarioCadastrado()
            }
            
            
            
        }
    }
    
    func registrarUsuario(nome: String?, senha: String?, email: String?, fotoUsuario: UIImage?){
        guard let email = email, let senha = senha, let nome = nome else { return }
        guard let profileImageData = fotoUsuario?.jpegData(compressionQuality: 0.3) else {
            print("sem foto")
            return }
        // refatorar para utilizar em outros lugares
        let fileName = NSUUID().uuidString
        let storageReference = storageProfileImages.child(fileName)
        
        storageReference.putData(profileImageData, metadata: nil) { meta, error in
            if let error = error {
                print(error.localizedDescription)
            }
            storageReference.downloadURL { url, error in
                guard let profileImageUrl = url?.absoluteString else { return }
                Auth.auth().createUser(withEmail: email, password: senha) { result, error in
                    if let error = error {
                        self.delegate?.alertaDadosDeCadastroIncorretos()
                        print(error.localizedDescription)
                    }
                    
                    guard let uid = result?.user.uid else { return }
                    let valores = ["email":email,
                                   "nome": nome,
                                   "foto": profileImageUrl]
                   usersREF.child(uid).updateChildValues(valores) { error, databaseReference in
                        if let error = error {
                            print("error ao salvar usuario no firebase: \(error.localizedDescription)")
                        }
                    }
                    
                    self.serviceCoreData.saveUsuario(nome: nome, email: email, foto: "")
                    do {
                        let usuarioLogado = try self.serviceCoreData.getUsuario(email: email)?.converterParaUsuario()
                        self.sessionManager.usuarioLogado = usuarioLogado
                        
                        
                    } catch {
                        print("erro ao salvar no coredata: \(error.localizedDescription)")
                    }
                    self.delegate?.usuarioCadastrado()
                }
                
            }
        }
        
    }
    
    
}
