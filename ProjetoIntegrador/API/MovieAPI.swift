//
//  MovieAPI.swift
//  ProjetoIntegrador
//
//  Created by Gui  on 14/06/22.
//

import Foundation
import UIKit

class MovieAPI {
     var filmesFromData: [Filme] = []
     var quantidadeDeFilmes: Int = 0
     var filmeDestaque: Filme?
    
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    // carregando lista de filmes da API
    func loadFilmes(completion: @escaping (([Filme])-> Void)){
        guard let url = URL(string: "https://mcuapi.herokuapp.com/api/v1/movies?page=1&limit=1000&columns=title%2Crelease_date%2Cphase%2Cpost_credit_scenes%2Ccover_url%2Csaga%2Cdirected_by%2Coverview&order=chronology%2CDESC") else {
            completion([])
            return
        }
        
        let task = session.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            
            do {
                let filmes = try self.decoder.decode(Data.self, from: data)
                DispatchQueue.main.async {
                    self.quantidadeDeFilmes = filmes.data.count
                    self.filmesFromData = filmes.data
                    self.filmeDestaque = filmes.data[2]
                    completion(self.filmesFromData)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }

    // convertendo imagem do poster do filme para UIImage
    func getPosterFilmeDestaqueDaApi(url: String?, completion: @escaping (UIImage?) -> Void) {
        guard let poster = url else {
            completion(UIImage(named: "default_poster"))
            return
            
        }
        guard let url = URL(string: poster) else {
            completion(UIImage(named: "default_poster"))
            return
            
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                guard let data = data else {
                    completion(UIImage(named: "default_poster"))
                    return
                }
                completion(UIImage(data: data))
            }
            
        }
        dataTask.resume()
    }
    
}

