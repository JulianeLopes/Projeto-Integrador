//
//  UsuarioEntities+CoreDataProperties.swift
//  
//
//  Created by Gui  on 19/07/22.
//
//

import Foundation
import CoreData
import UIKit


extension UsuarioEntities {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UsuarioEntities> {
        return NSFetchRequest<UsuarioEntities>(entityName: "UsuarioEntities")
    }

    @NSManaged public var nome: String?
    @NSManaged public var email: String?
    @NSManaged public var senha: String?
    @NSManaged public var foto: Foundation.Data?
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
    
    public var wrappedFoto: UIImage? {
        guard let foto = foto,
              let usuarioFoto = UIImage(data: foto) else {
                  return UIImage(named: "default_poster")
              }
        return usuarioFoto
    }
    
    public var wrappedNivelDeFa: Double {
        nivelDeFa
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

    func converterParaUsuario() -> Usuario {
        return Usuario(nome: wrappedNome, email: wrappedEmail, senha: wrappedSenha, foto: wrappedFoto, nivelDeFa: nivelDeFa, filmesFavoritos: [])
    }
    
}
