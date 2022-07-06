//
//  UserDefaultsService.swift
//  ProjetoIntegrador
//
//  Created by Giselle Andrade on 04/07/22.
//

import Foundation

class UserDefaultsService {
    static var shared = UserDefaultsService()
    
    private let userDefaults = UserDefaults.standard
    
    private var titulosFilmes: [String]{
        userDefaults.object(forKey: "tituloFilmes") as? [String] ?? []
    }
    
    func loadDefaults() -> [String]{
        return titulosFilmes
    }
    
    func addNovoNome(_ titulo: String){
        var filmes = titulosFilmes
        
        if filmes.contains(where: { tituloDoFilme in
            tituloDoFilme == titulo
        }) {
            return
        } else {
            filmes.append(titulo)
            userDefaults.set(filmes, forKey: "tituloFilmes")
        }
    }
    
    func remove(row: Int){
        var filmes = titulosFilmes
        filmes.remove(at: row)
        userDefaults.set(filmes, forKey: "tituloFilmes")
    }
}
