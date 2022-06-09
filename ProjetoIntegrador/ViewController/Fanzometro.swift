//
//  Fanzometro.swift
//  ProjetoIntegrador
//
//  Created by Giselle Andrade on 29/05/22.
//

import UIKit

class Fanzometro: UIViewController {
    
 
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var favoritosCollectionView: UICollectionView!
    @IBOutlet weak var porcentagemLabel: UILabel!
    
    let viewModel = FanzometroViewModel()

    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        userImageView.image = UIImage(named: usuarioLogado?.foto ?? "")
        userImageView.layer.cornerRadius = 150
        userImageView.layer.borderWidth = 4
        userImageView.layer.borderColor = UIColor.red.cgColor
        favoritosCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoritosCollectionView.reloadData()
        porcentagemLabel.text = "\(fanzometroPorcentagem(listaDeFavoritos: usuarioLogado?.filmesFavoritos ?? [])) % "
    }
    
}

extension Fanzometro: UICollectionViewDataSource {
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.numeroDeFilmesFavoritos()
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"fanzometroCell", for:  indexPath) as? FanzometroCollectionViewCell
 
    // verificar no colearning como não fazer um forceunwrap nesse caso:
    cell?.customizaCelula(filme: (usuarioLogado?.filmesFavoritos[indexPath.item])!)
    
    return cell ??  UICollectionViewCell()
}
    
    func fanzometroPorcentagem(listaDeFavoritos: [Filme]) -> Double{
        
        let quantidadeDeFavoritos = Double(listaDeFavoritos.count)
        let quantidadeDeFilmes = Double(Servico.shared.listaDeFilmes.count)
        
        let porcentagemFanzometro = (quantidadeDeFavoritos / quantidadeDeFilmes)*100

        return porcentagemFanzometro
    }
}
    
