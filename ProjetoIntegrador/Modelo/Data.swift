//
//  Filme.swift
//  ProjetoIntegrador
//
//  Created by Fernanda Perovano on 29/05/22.
//

import UIKit

struct Data: Codable {
    var data: [Filme]
}

class Filme: Codable {
    var title: String?
    var release_date: String?
    var overview: String?
    var cover_url: String?
    var directed_by: String?
    var phase: Int?
    var saga: String?
    var post_credit_scenes: Int?
    
    init(filme: FilmesEntities){
        self.title = filme.title
        self.release_date = filme.release_date
        self.overview = filme.overview
        self.cover_url = filme.cover_url
        self.directed_by = filme.directed_by
        self.phase = Int(filme.phase)
        self.saga = filme.saga
        self.post_credit_scenes = Int(filme.post_credit_scenes)
    }
    
    init(filmeParaAssistir: FilmesParaAssistir) {
        self.title = filmeParaAssistir.title
        self.release_date = filmeParaAssistir.release_date
        self.overview = filmeParaAssistir.overview
        self.cover_url = filmeParaAssistir.cover_url
        self.directed_by = filmeParaAssistir.directed_by
        self.phase = Int(filmeParaAssistir.phase)
        self.saga = filmeParaAssistir.saga
        self.post_credit_scenes = Int(filmeParaAssistir.post_credit_scenes)
    }

}
