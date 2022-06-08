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
    var foto: String
    let nivelDeFa: Double
    var filmesFavoritos: [Filme]
    
    
    init(nome: String, email: String, senha: String, foto: String, nivelDeFa: Double, filmesFavoritos: [Filme]){
    self.nome = nome
    self.email = email
    self.senha = senha
    self.foto = foto
    self.nivelDeFa = nivelDeFa
    self.filmesFavoritos = filmesFavoritos
    }
}
