//
//  MovieAPI.swift
//  ProjetoIntegrador
//
//  Created by Gui  on 14/06/22.
//

import Foundation

protocol MovieAPIDelegate {
    func atualizaDados(filmes: [Filme])
}

class MovieAPI {
    var delegate: MovieAPIDelegate?
     var filmesFromData: [Filme] = []
     var quantidadeDeFilmes: Int = 0
     var filmeDestaque: Filme?
    
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    func loadFilmes(completion: @escaping (([Filme])-> Void)){
        let url = URL(string: "https://mcuapi.herokuapp.com/api/v1/movies?page=1&limit=1000&columns=title%2Crelease_date%2Cphase%2Cpost_credit_scenes%2Ccover_url%2Csaga%2Cdirected_by%2Coverview&order=chronology%2CDESC")!
        let task = session.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            
            do {
                let filmes = try self.decoder.decode(Data.self, from: data)
                DispatchQueue.main.async {
                    print("api: \(filmes.data.count)")
                    self.quantidadeDeFilmes = filmes.data.count
                    self.filmesFromData = filmes.data
                    self.filmeDestaque = filmes.data[1]
                    self.delegate?.atualizaDados(filmes: self.filmesFromData)
                    completion(self.filmesFromData)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }

}

