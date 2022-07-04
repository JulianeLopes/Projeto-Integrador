//
//  UserDefaultsService.swift
//  ProjetoIntegrador
//
//  Created by Giselle Andrade on 04/07/22.
//

import Foundation

class UserDefaultsService {
    
    let userDefaults = UserDefaults.standard
    var tituloFilmes: [String] = []
    
    func loadDefaults(completion: ([String]) ->Void){
        tituloFilmes = userDefaults.object(forKey: "tituloFilmes") as? [String] ?? []
        userDefaults.set(tituloFilmes, forKey: "tituloFilmes")
        completion(tituloFilmes)
    }
    
    func addNovoNome(_ titulo: String){
        tituloFilmes.append(titulo)
        userDefaults.set(tituloFilmes, forKey: "tituloFilmes")
    }
    
    func remove(row: Int){
        tituloFilmes.remove(at: row)
        userDefaults.set(tituloFilmes, forKey: "tituloFilmes")
    }
    
//    func remove(filme: String?) throws {
//        
//        if let filme = tituloFilmes.first(where: { filmeAssistido in
//            
//            return filmeAssistido == filme
//            
//        }) {
//           
//            tituloFilmes.remove(at: <#T##Int#>)
//            
//        }
//    }
    
}
