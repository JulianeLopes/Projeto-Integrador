//
//  Usuario.swift
//  ProjetoIntegrador
//
//  Created by Juliane Lopes Moreira Rodrigues on 29/05/22.
//

import Foundation
import UIKit

class Usuario {
    let nome: String
    let email: String
    let senha: String
    var foto: UIImage?
    let nivelDeFa: Double
    var filmesFavoritos: [Filme]
    var filmesAssistirDepois: [Filme]
    
    
    init(nome: String, email: String, senha: String, foto: UIImage?, nivelDeFa: Double, filmesFavoritos: [Filme], filmesAssistirDepois: [Filme]){
    self.nome = nome
    self.email = email
    self.senha = senha
    self.foto = foto
    self.nivelDeFa = nivelDeFa
    self.filmesFavoritos = filmesFavoritos
    self.filmesAssistirDepois = filmesAssistirDepois
    }
    
    init(usuarioEntities: UsuarioEntities){
        self.nome = usuarioEntities.wrappedNome
        self.email = usuarioEntities.wrappedEmail
        self.foto = usuarioEntities.wrappedFoto
        self.nivelDeFa = usuarioEntities.nivelDeFa
        self.senha = usuarioEntities.wrappedSenha
        self.filmesFavoritos = usuarioEntities.listaDeFilmesFavoritos
        self.filmesAssistirDepois = usuarioEntities.listaDeFilmesAssistirDepois
        
    }
}
