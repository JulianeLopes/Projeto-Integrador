//
//  ServiceCoreData.swift
//  ProjetoIntegrador
//
//  Created by Gui  on 19/07/22.
//

import Foundation
import CoreData
import UIKit

class ServiceCoreData {
    
    private lazy var container = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    private lazy var context = container.viewContext
    
    
    // MARK: - Public Methods
    
    func saveContext(){
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.saveContext()
    }
    
    func saveUsuario(nome: String, email: String, foto: String?) {

        if verificaUsuarioCoreData(nome: nome, email: email) {
           return
        }else {
            let usuario = UsuarioEntities(context: context)
            usuario.nome = nome
            usuario.email = email
            usuario.foto = foto
            usuario.nivelDeFa = 0.0
            usuario.filmesentities = []
            usuario.filmesParaAssistir = []
            saveContext()
        }
    }
    
    func fetchUsuario() throws -> [UsuarioEntities] {
        let usuarios = try context.fetch(UsuarioEntities.fetchRequest())
        return usuarios
    }
    
    func verificaUsuarioCoreData(nome: String, email: String) -> Bool {
        let usuarios = try! context.fetch(UsuarioEntities.fetchRequest())
        let usuarioExiste = usuarios.contains { usuario in
            usuario.nome == nome && usuario.email == email
        }
        return usuarioExiste
    }
    
}
