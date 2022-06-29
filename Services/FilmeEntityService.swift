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
    
    private let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
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
    
    
    func remove(filme: Filme, completion: ([Filme]) -> Void) {
        let filmeConvertido = FilmesEntities(filme: filme, context: context)
        context.delete(filmeConvertido)
        do {
            try context.save()
           // completion(context.fetch(FilmesEntities.fetchRequest()))
            print("sucesso ao remover")
        } catch  {
            print("erro ao remover")
        }
    }
          
}

