//
//  ConfiguracaoViewModel.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/06/07.
//

import Foundation


class ConfiguracaoViewModel {
    
    var serviceFireBase = FireBaseService()
    
    private let listaConfiguracao: [String] = ["Conta", "Dados Pessoais", "Trocar usuário", "Sair"]
    
    func quantidadeDeItens() -> Int{
        return listaConfiguracao.count
    }
    
    func getItem(row: Int) -> String {
        return listaConfiguracao[row]
    }
    
    func logout(){
        serviceFireBase.logOut()
    }
}
