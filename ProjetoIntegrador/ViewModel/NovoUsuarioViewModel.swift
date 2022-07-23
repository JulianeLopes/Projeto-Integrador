//
//  NovoUsuarioViewModel.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/06/09.
//

import Foundation
import FirebaseAuth

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
 }
