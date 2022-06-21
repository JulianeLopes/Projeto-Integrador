//
//  FilmeViewModel.swift
//  ProjetoIntegrador
//
//  Created by Fernanda Perovano on 12/06/22.
//

import Foundation
import UIKit


class FilmeViewModel {
    
    private let filme: Filme
    
    init (filme: Filme) {
        self.filme = filme
    }
    
//    func getPoster() -> UIImage? {
//        guard let image = filme.poster else {
//            return nil
//        }
//        return image
//    }
    
    func getTitulo() -> String {
        return filme.title
    }
}
