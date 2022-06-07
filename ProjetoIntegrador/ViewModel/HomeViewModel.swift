//
//  HomeViewModel.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/05/30.
//

import Foundation
import UIKit

class HomeViewModel {
    
    func numeroDeFilmesEmdestaques() -> Int {
        return Servico.listaDeFilmeEmDestaques.count
    }
    
    
    
}
