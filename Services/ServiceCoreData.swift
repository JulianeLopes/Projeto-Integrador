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
        if verificaUsuarioCoreData(nome: nome, email: email) == true {
            let usuario = try? getUsuario(email: email)
            usuario?.foto = foto
            saveContext()
        } else {
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
    
    func saveUsuario(nome: String, emailCadastrado: String, emailNovo: String?, foto: Foundation.Data?) {

        if verificaUsuarioCoreData(nome: nome, email: emailCadastrado) == true {
            let usuario = try? getUsuario(email: emailCadastrado)
            usuario?.foto = foto
            usuario?.email = emailNovo
            saveContext()
        } else {
            let usuario = UsuarioEntities(context: context)
            usuario.nome = nome
            usuario.email = emailCadastrado
            usuario.foto = foto
            usuario.nivelDeFa = 0.0
            usuario.filmesentities = []
            usuario.filmesParaAssistir = []
            saveContext()
        }
    }
    
    //trazendo a lista de usuarios no coredata
   private func fetchUsuarios() throws -> [UsuarioEntities] {
        let usuarios = try context.fetch(UsuarioEntities.fetchRequest())
        return usuarios
    }
    
    // trazendo o usuario salvo no core data
    func getUsuario(email: String) throws -> UsuarioEntities? {
        let usuarios = try fetchUsuarios()
        return usuarios.first { usuario in
            return usuario.email == email
        }
    }
    
    // retorna booleano para usar na função de salvar, se existe não salva mas atualiza dados, se não salva o usuario
    private func verificaUsuarioCoreData(nome: String, email: String) -> Bool {
        var usuarios: [UsuarioEntities] = []
        
        do {
            usuarios = try fetchUsuarios()
        } catch {
            print(error)
        }
        
        let usuarioExiste = usuarios.contains { usuario in
            usuario.nome == nome && usuario.email == email
        }
        return usuarioExiste
    }
    
    //MARK: - Favoritos
    
    //Adicionando filme na lista de favoritos do usuário
    func adicionarFilmesAosFavoritos(usuario: UsuarioEntities, filme: Filme) throws {
        let favoritos = usuario.wrappedFilmesentities
        if let filmeAAdicionar = favoritos.first(where: { favorito in
            return favorito.title == filme.title
        }){
            print("filme existe na lista")
        } else {
            let filmeAdd = FilmesEntities(filme: filme, context: context)
            usuario.addToFilmesentities(filmeAdd)
            saveContext()
        }
    }
    // removendo filme da lista de favoritos
    func removerFilmesDosFavoritos(usuario: UsuarioEntities, filme: Filme) throws {
        let favoritos = usuario.wrappedFilmesentities
        if let filmeARemover = favoritos.first(where: { favorito in
            return favorito.title == filme.title
        }){
            usuario.removeFromFilmesentities(filmeARemover)
            saveContext()
        }
    }
    
    // convertendo a lista de favoritos entities para lista de filmes
    func favoritos(favoritos: [FilmesEntities]) throws -> [Filme] {
            var filmes: [Filme] = []
            favoritos.forEach { filmeEntity in
                let filme = Filme(filme: filmeEntity)
                filmes.append(filme)
            }
            return filmes
    }
    
    // MARK: - lista de assistir mais tarde
    
    // adicionando o filme na lista de assistir mais tarde do usuário
    func adicionarFilmesAssistir(usuario: UsuarioEntities, filme: Filme) {
        let lista = usuario.wrappedFilmesParaAssistir
        
        if let filmeAAdicional = lista.first(where: { assistir in
            return assistir.title == filme.title
        }) {
            print("filme existe na lista")
        } else {
            let filmeAdd = FilmesParaAssistir(filme: filme, context: context)
            usuario.addToFilmesParaAssistir(filmeAdd)
            saveContext()
        }
    }
    
    // removendo filme da lista de assistir mais tarde
    func removerAssistirMaisTarde(usuario: UsuarioEntities, filme: Filme) throws {
        let aAssistir = usuario.wrappedFilmesParaAssistir
        if let filmeARemover = aAssistir.first(where: { assistir in
            return assistir.title == filme.title
        }){
            usuario.removeFromFilmesParaAssistir(filmeARemover)
            saveContext()
        }
    }
    
    // carregando a lista de assistir mais tarde
    func assistirMaisTarde(lista: [FilmesParaAssistir]) throws -> [Filme] {
            var filmes: [Filme] = []
            lista.forEach { filmeEntity in
                let filme = Filme(filmeParaAssistir: filmeEntity)
                filmes.append(filme)
            }
            return filmes
    }
}
