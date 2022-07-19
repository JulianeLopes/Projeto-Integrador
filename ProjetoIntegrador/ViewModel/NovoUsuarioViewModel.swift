//
//  NovoUsuarioViewModel.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/06/09.
//

import Foundation

protocol NovoUsuarioViewModelDelegate {
    func alertaDadosDeCadastroIncorretos()
    func cadastroEfetuado()
    
}

class NovoUsuarioViewModel {
   var delegate: NovoUsuarioViewModelDelegate?
    
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
 }
