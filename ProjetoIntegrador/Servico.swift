//
//  Servico.swift
//  ProjetoIntegrador
//
//  Created by Juliane Lopes Moreira Rodrigues on 29/05/22.
//

import Foundation
import UIKit

class Servico {
    
        static let eternos = Filme(
        titulo: "Eternos",
        elenco: "Chloé Zhao, Ryan Firpo, Kaz Firpo, Patrick Burleigh",
        direcao: "Chloé Zhao",
        descricao: "Os Eternos são uma raça de seres imortais que viveram durante a antiguidade da Terra, moldando sua história e suas civilizações enquanto batalhavam os malignos Deviantes.",
       // indicacaoDeFilmes: [viuvaNegra, shangchi, vingadores],
        poster: UIImage(named: "eternos"))
    
    static let viuvaNegra =  Filme(
        titulo: "Viuva Negra",
        elenco: "Eric Pearson, Жаклин Шеффер, Jac Schaeffer, Ned Benson",
        direcao: "Cate Shortland",
        descricao: "Ao nascer, a Viúva Negra, então conhecida como Natasha Romanova, é entregue à KGB, que a prepara para se tornar sua agente suprema. Porém, o seu próprio governo tenta matá-la quando a União Soviética se desfaz.",
      //  indicacaoDeFilmes: [eternos, shangchi, vingadores],
        poster: UIImage(named: "viuvaNegra"))
    
    static let shangchi = Filme(
        titulo: "ShangChi",
        elenco: "Elísabet Ronaldsdóttir, Harry Yoon, Nat Sanders",
        direcao: " Destin Cretton",
        descricao: "Shang-Chi é o filho do líder de uma organização criminosa poderosa. O rapaz foi criado desde criança para ser um guerreiro, mas decidiu abandonar esse caminho e fugiu para viver uma vida pacífica. Porém, tudo isso muda quando ele é atacado por um grupo de assassinos e se vê forçado a enfrentar seu passado.",
       // indicacaoDeFilmes: [eternos, viuvaNegra, vingadores],
        poster: UIImage(named: "shangchi"))
    
    static let vingadores = Filme(
        titulo: "Vingadores",
        elenco: "Christopher Markus, Stephen McFeely",
        direcao: " Anthony Russo, Joe Russo",
        descricao: "Após Thanos eliminar metade das criaturas vivas, os Vingadores têm de lidar com a perda de amigos e entes queridos. Com Tony Stark vagando perdido no espaço sem água e comida, Steve Rogers e Natasha Romanov lideram a resistência contra o titã louco.",
      //  indicacaoDeFilmes: [eternos, viuvaNegra, shangchi],
        poster: UIImage(named: "vingadores"))
    
    
   // var listaDeFilmes: [Filme] = [ eternos, viuvaNegra, shangchi, vingadores ]
    
}


