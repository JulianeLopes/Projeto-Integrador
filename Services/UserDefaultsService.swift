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
    
    func loadDefaults(completion: ([String]) ->Void){
        completion(titulosFilmes)
    }
    
    func addNovoNome(_ titulo: String){
        var filmes = titulosFilmes
        filmes.append(titulo)
        userDefaults.set(filmes, forKey: "tituloFilmes")
    }
    
    func remove(row: Int){
        var filmes = titulosFilmes
        filmes.remove(at: row)
        userDefaults.set(filmes, forKey: "tituloFilmes")
    }
    

    
}
