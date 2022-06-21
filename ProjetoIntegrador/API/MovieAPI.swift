//
//  MovieAPI.swift
//  ProjetoIntegrador
//
//  Created by Gui  on 14/06/22.
//

import Foundation

class MovieAPI {
    
    private var filmesFromData: [Filme] = []
    private var quantidadeDeFilmes: Int = 0
    
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    
//    func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
//            NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
//                completion(data: data, response: response, error: error)
//                }.resume()
//        }

    
    func loadFilmes(){
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
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func getQuantidadeDeFilmes() -> Int{
        return quantidadeDeFilmes
    }
    
    func getFilme(posicao: Int) -> Filme {
        return filmesFromData[posicao]
    }
    
    func getListaDeFilme() -> [Filme]{
        return filmesFromData
    }
    
    func getFilmeDestaque() -> Filme?{
        return nil
    }
//    func downloadImage(url: URL) -> UIImage {
//
//            getDataFromUrl(url) { (data, response, error)  in
//                dispatch_async(dispatch_get_main_queue()) { () -> Void in
//                    guard let data = data where error == nil else { return }
//
//                    let image:UIImage = UIImage(data: data)!
//
//                    return image
//                }
//            }
//        }
}

