//
//  DetalheDoFilmeViewModel.swift
//  ProjetoIntegrador
//
//  Created by Fernanda Perovano on 12/06/22.
//

import Foundation
import UIKit

protocol FilmesViewModelDelegate {
    func atualizaFavorito()
    
}
class DetalheDoFilmeViewModel {
    var delegate: FilmesViewModelDelegate?
    var servico = Servico()
    
    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
    
    private let filme: Filme

    
    init(filme: Filme) {
        self.filme = filme
    }
    
    func getPoster() -> UIImage? {
        guard let image = filme.poster else {
            return nil
        }
        return image
    }
    
    func favorita(filme: Filme?){
        guard let filme = filme else { return }
        usuarioLogado?.filmesFavoritos.append(filme)
        delegate?.atualizaFavorito()
    }
    
    func getTitulo() -> String {
        return filme.titulo
    }
    
    func getElenco() -> String {
        return filme.elenco
    }
    
    func getDirecao() -> String {
        return filme.direcao
    }
    
    func getDescricao() -> String {
        return filme.descricao
    }
    
    func getDetalheDoFilmeViewModel(posicao: Int?) -> DetalheDoFilmeViewModel? {
        guard let posicao = posicao else {
            return nil
        }
        let filmeSelecionado = servico.listaDeFilmeEmDestaques[posicao]
        let detalheViewModel = DetalheDoFilmeViewModel(filme: filmeSelecionado)
        return detalheViewModel
    }
    
}
