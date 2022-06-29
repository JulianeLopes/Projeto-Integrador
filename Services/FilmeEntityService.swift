//
//  FilmeEntityService.swift
//  ProjetoIntegrador
//
//  Created by Juliane Lopes Moreira Rodrigues on 28/06/22.
//

import Foundation
import UIKit

class FilmeEntityService {
    
    // MARK: - Private Properies
    
    private lazy var container = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    private lazy var context = container.viewContext
    
    // MARK: - Public Methods
    
    func favoritar(filme: Filme) throws {
        _ = FilmesEntities(filme: filme, context: context)
       
        try context.save()
    }
    
    func favoritos() throws -> [Filme] {
        let favoritos = try context.fetch(FilmesEntities.fetchRequest())
        var filmes: [Filme] = []
        favoritos.forEach { filmeEntity in
            let filme = Filme(filme: filmeEntity)
            filmes.append(filme)
        }
        return filmes
    }
    
    
    func remove(filme: Filme) {
   // implementar mais tarde
    }
}
