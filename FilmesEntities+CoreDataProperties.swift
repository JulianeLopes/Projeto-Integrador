//
//  FilmesEntities+CoreDataProperties.swift
//  
//
//  Created by Gui  on 19/07/22.
//
//

import Foundation
import CoreData


extension FilmesEntities {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FilmesEntities> {
        return NSFetchRequest<FilmesEntities>(entityName: "FilmesEntities")
    }

    @NSManaged public var cover_url: String?
    @NSManaged public var directed_by: String?
    @NSManaged public var overview: String?
    @NSManaged public var phase: Int16
    @NSManaged public var post_credit_scenes: Int16
    @NSManaged public var release_date: String?
    @NSManaged public var saga: String?
    @NSManaged public var title: String?
    @NSManaged public var parenteUsuario: UsuarioEntities?

}
