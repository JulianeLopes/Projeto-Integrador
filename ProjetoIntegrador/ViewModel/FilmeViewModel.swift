//
//  FilmeViewModel.swift
//  ProjetoIntegrador
//
//  Created by Fernanda Perovano on 12/06/22.
//

import Foundation
import UIKit


class FilmeViewModel {
    
    var servicoDeApi = MovieAPI()

    private var filme: Filme
    
    init (filme: Filme) {
        self.filme = filme
    }
    
    func getPoster(completion: @escaping (UIImage?) -> Void) {
        servicoDeApi.getPosterFilmeDestaqueDaApi(url: filme.cover_url, completion: completion)
        
    }
    
    func getTitulo() -> String? {
        return filme.title
    }
    
    func getDirecao() -> String {
        return filme.directed_by ?? ""
    }
}
