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
    
    private var avaliacaoFilmes: [String: Int]{
        userDefaults.object(forKey: "avaliacaoFilmes") as? [String: Int] ?? [:]
    }
    
    func loadDefaults() -> [String]{
        return titulosFilmes
    }
    
    func loadAvaliacao() -> [String: Int]{
        return avaliacaoFilmes
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
    
    func addNovaAvaliacao(titulo: String, avaliacao: Int){
        var avaliacoes = avaliacaoFilmes
        avaliacoes[titulo] = avaliacao
        userDefaults.set(avaliacoes, forKey: "avaliacaoFilmes")
    }
    
    func remove(row: Int){
        var filmes = titulosFilmes
        filmes.remove(at: row)
        userDefaults.set(filmes, forKey: "tituloFilmes")
    }
}
