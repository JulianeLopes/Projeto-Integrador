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
    
    
    func saveContext(){
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.saveContext()
    }
    
    func saveUsuario(nome: String, email: String, foto: Foundation.Data?) {

        if verificaUsuarioCoreData(nome: nome, email: email) {
            let usuario = try? getUsuario(email: email)
            usuario?.foto = foto
        } else {
            let usuario = UsuarioEntities(context: context)
            usuario.nome = nome
            usuario.email = email
            usuario.foto = foto
            usuario.nivelDeFa = 0.0
            usuario.filmesentities = []
            usuario.filmesParaAssistir = []
        }
        saveContext()
    }
    
    func getUsuario(email: String) throws -> UsuarioEntities? {
        let usuarios = try fetchUsuarios()
        return usuarios.first { usuario in
            return usuario.email == email
        }
    }
    
    func fetchUsuarios() throws -> [UsuarioEntities] {
        let usuarios = try context.fetch(UsuarioEntities.fetchRequest())
        return usuarios
    }
    
    private func verificaUsuarioCoreData(nome: String, email: String) -> Bool {
        let usuarios = try! context.fetch(UsuarioEntities.fetchRequest())
        let usuarioExiste = usuarios.contains { usuario in
            usuario.nome == nome && usuario.email == email
        }
        return usuarioExiste
    }
    
    func verificaEmailCoreData(email: String) -> Bool {
        let usuarios = try! context.fetch(UsuarioEntities.fetchRequest())
        let emailExiste = usuarios.contains { usuario in
            usuario.email == email
        }
        return emailExiste
    }
    
    func adicionarFilmesAosFavoritos(usuario: UsuarioEntities, filme: Filme) throws {
        let favoritos = usuario.wrappedFilmesentities
        if let filmeAAdicionar = favoritos.first(where: { favorito in
            return favorito.title == filme.title
        }){
            usuario.addToFilmesentities(filmeAAdicionar)
            saveContext()
        }
        
    }
    
    func removerFilmesDosFavoritos(usuario: UsuarioEntities, filme: Filme) throws {
        let favoritos = usuario.wrappedFilmesentities
        if let filmeARemover = favoritos.first(where: { favorito in
            return favorito.title == filme.title
        }){
            usuario.removeFromFilmesentities(filmeARemover)
            saveContext()
        }
    }
    
    
    func adicionarFilmesAssistir(usuario: UsuarioEntities, filme: FilmesParaAssistir) {
        usuario.addToFilmesParaAssistir(filme)
        saveContext()
    }
    
    func removerFilmesAssistir(usuario: UsuarioEntities, filme: FilmesParaAssistir) {
        usuario.removeFromFilmesParaAssistir(filme)
        saveContext()
    }
    
    func favoritos(favoritos: [FilmesEntities]) throws -> [Filme] {
            var filmes: [Filme] = []
            favoritos.forEach { filmeEntity in
                let filme = Filme(filme: filmeEntity)
                filmes.append(filme)
            }
            return filmes
    }
    
    func assistirMaisTarde(lista: [FilmesParaAssistir]) throws -> [Filme] {
            var filmes: [Filme] = []
            lista.forEach { filmeEntity in
                let filme = Filme(filmeParaAssistir: filmeEntity)
                filmes.append(filme)
            }
            return filmes
    }
    
    func removerAssistirMaisTarde(usuario: UsuarioEntities, filme: Filme) throws {
        let aAssistir = usuario.wrappedFilmesParaAssistir
        if let filmeARemover = aAssistir.first(where: { assistir in
            return assistir.title == filme.title
        }){
            usuario.removeFromFilmesParaAssistir(filmeARemover)
            saveContext()
        }
    }
    
    func adicionarAssistirMaisTarde(usuario: UsuarioEntities, filme: Filme) throws {
        let aAssistir = usuario.wrappedFilmesParaAssistir
        if let filmeAAssistir = aAssistir.first(where: { assistir in
            return assistir.title == filme.title
        }){
            usuario.addToFilmesParaAssistir(filmeAAssistir)
            saveContext()
        }
    }
}
