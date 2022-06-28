//
//  FilmeService.swift
//  ProjetoIntegrador
//
//  Created by Juliane Lopes Moreira Rodrigues on 28/06/22.
//

import Foundation
import UIKit

class FilmeService {
    
    // MARK: - Private Properies
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - Public Methods
    
    func save(filme: String, completion: () -> Void) {
        var filmeSelecionado = FilmesEntities(context: context)
        filmeSelecionado.title = filme
        
        do {
            try context.save()
            completion()
        } catch {
            print(error)
        }
    }
    
    func remove(filme: FilmesEntities, completion: () -> Void) {
        context.delete(filme)
        
        do {
            try context.save()
            completion()
        } catch {
            print(error)
        }
    }
    
    func fetch(completion: ([FilmesEntities]) -> Void) {
        do {
            let fetch = FilmesEntities.fetchRequest()
            let filmes = try context.fetch(fetch)
            completion(filmes)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
