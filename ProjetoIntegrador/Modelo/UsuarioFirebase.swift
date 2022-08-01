//
//  UsuarioFirebase.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/07/31.
//

import Foundation

struct UsuarioFirebase{
    let uid: String
    let email: String
    var foto: URL?
    let nome: String
    
    init(uid: String, dicionario: [String : AnyObject]) {
        self.uid = uid
        self.email = dicionario["email"] as! String
        self.nome = dicionario["nome"] as! String
        
        if let fotoPerfil = dicionario["foto"] as? String {
            guard let url = URL(string: fotoPerfil) else { return }
            self.foto = url
        }
    }
}
