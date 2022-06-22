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

struct Filme: Codable {
    var title: String
    var release_date: String?
    var overview: String?
    var cover_url: String?
    var directed_by: String?
    var phase: Int?
    var saga: String?
    var post_credit_scenes: Int?

}
