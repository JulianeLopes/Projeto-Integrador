//
//  Spoiler.swift
//  ProjetoIntegrador
//
//  Created by Gui  on 23/06/22.
//

import Foundation

class Spoiler {
    
    var title: String
    var spoiler: String?
    var elenco: String
    var descricaoCenasPosCreditos: String?
    
    init (title: String, spoiler: String?, elenco: String, descricaoCenaPosCreditos: String?) {
        
        self.title = title
        self.spoiler = spoiler
        self.elenco = elenco
        self.descricaoCenasPosCreditos = descricaoCenaPosCreditos
    }
    
}
