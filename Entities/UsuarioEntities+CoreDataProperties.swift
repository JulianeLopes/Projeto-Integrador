//
//  UsuarioEntities+CoreDataProperties.swift
//  
//
//  Created by Gui  on 19/07/22.
//
//

import Foundation
import CoreData


extension UsuarioEntities {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UsuarioEntities> {
        return NSFetchRequest<UsuarioEntities>(entityName: "UsuarioEntities")
    }

    @NSManaged public var nome: String?
    @NSManaged public var email: String?
    @NSManaged public var senha: String?
    @NSManaged public var foto: String?
    @NSManaged public var nivelDeFa: Double
    @NSManaged public var filmesentities: NSSet?
    @NSManaged public var filmesParaAssistir: NSSet?

    public var wrappedNome: String {
        nome ?? ""
    }
    
    public var wrappedEmail: String {
        email ?? ""
    }
    
    public var wrappedSenha: String {
        senha ?? ""
    }
    
    public var wrappedFoto: String {
        foto ?? ""
    }
    
    public var wrappedNivelDeFa: Double {
        nivelDeFa ?? 0.0
    }
    
    public var wrappedFilmesentities: [FilmesEntities] {
        let filmes = filmesentities as? Set<FilmesEntities> ?? []
        return filmes.sorted {
            $0.wrappedTitle < $1.wrappedTitle
        }
    }
    
    public var wrappedFilmesParaAssistir: [FilmesParaAssistir] {
        let filmes = filmesParaAssistir as? Set<FilmesParaAssistir> ?? []
        return filmes.sorted {
            $0.wrappedTitle < $1.wrappedTitle
        }
    }
    
}

// MARK: Generated accessors for filmesentities
extension UsuarioEntities {

    @objc(addFilmesentitiesObject:)
    @NSManaged public func addToFilmesentities(_ value: FilmesEntities)

    @objc(removeFilmesentitiesObject:)
    @NSManaged public func removeFromFilmesentities(_ value: FilmesEntities)

    @objc(addFilmesentities:)
    @NSManaged public func addToFilmesentities(_ values: NSSet)

    @objc(removeFilmesentities:)
    @NSManaged public func removeFromFilmesentities(_ values: NSSet)

}
