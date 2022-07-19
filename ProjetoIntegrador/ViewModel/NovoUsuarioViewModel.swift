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
    func cadastroEfetuado()
    func usuarioCadastrado()
    
}

class NovoUsuarioViewModel {
    var delegate: NovoUsuarioViewModelDelegate?
    var serviceCoreData: ServiceCoreData = .init()
    
    // criando um usuário universal vazio para preencher
    var novoUsuarioCriado: Usuario = Usuario(nome: "", email: "", senha: "", foto: "", nivelDeFa: 0.0, filmesFavoritos: [])
    
    //validacao de cadastro
    private func novoUsuario(nome: String?, email: String?, senha: String?) -> Usuario {
        if let nome = nome, let email = email, let senha = senha {
            if email.contains("@") && senha.count == 6 {
                    novoUsuarioCriado = Usuario(nome: nome, email: email, senha: senha, foto: "", nivelDeFa: 0.0, filmesFavoritos: [])
                delegate?.cadastroEfetuado()
                return novoUsuarioCriado
            }
        }
        // alertar o usuário que os dados estão incorretos
        delegate?.alertaDadosDeCadastroIncorretos()
        return novoUsuarioCriado
    }
    
    // adiciona o usuario na lista de usuario
    func adicionaUsuario(nome: String?, email: String?, senha: String?){
        ServicoDeUsuario.listaDeUsuario.append(novoUsuario(nome: nome, email: email, senha: senha))
    }
    
    func registrarUsuario(email: String?, senha: String?, nome: String?){
            guard let email = email, let senha = senha, let nome = nome else { return }
            Auth.auth().createUser(withEmail: email, password: senha) { authResult, error in
                
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    self.serviceCoreData.saveUsuario(nome: nome, email: email, foto: "")
                    self.delegate?.usuarioCadastrado()
                }
                
                
                
            }
        }
 }
