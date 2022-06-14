//
//  MovieAPI.swift
//  ProjetoIntegrador
//
//  Created by Gui  on 14/06/22.
//

import Foundation

protocol MovieAPIDelegate {
    
    func buscou(movie: Filme)
    
}

struct MovieAPI {
    
    var delegate: MovieAPIDelegate?
    
    func buscarMovies() {
        
        let url = URL(string: "")!
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard let dataValue = data else {
                return
            }
            print(dataValue)
            
//            let movie = try! JSONDecoder().decode(Filme.self, from: dataValue)
            DispatchQueue.main.async {
                
//                self.delegate?.buscou(movie: movie)
                
            }
        }
        task.resume()
        
    }
    
}
