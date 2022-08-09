//
//  Fanzometro.swift
//  ProjetoIntegrador
//
//  Created by Giselle Andrade on 29/05/22.
//

import UIKit
import MBCircularProgressBar

class Fanzometro: UIViewController {
    
    let serviceAPI = MovieAPI()
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var favoritosCollectionView: UICollectionView!
    @IBOutlet weak var porcentagemLabel: UILabel!
    @IBOutlet weak var progressView: MBCircularProgressBarView!
    
    let viewModel = FanzometroViewModel()
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        configuraTela()
        serviceAPI.loadFilmes { listaDeFilmes in
            DispatchQueue.main.async {
                self.viewModel.quantidadeDeFilmes = listaDeFilmes.count
            }
        }
        self.progressView.value = 0
        
    }
    
    
    // função para configurar a foto do usuário na tela
    private func configuraTela() {
        userImageView.image = viewModel.getFotoUsuario()
        userImageView.layer.cornerRadius = 120
        //userImageView.layer.borderWidth = 1
        favoritosCollectionView.dataSource = self
        configuraPorcentagem()
    
    }
    
    // para atualizar a lista de filmes favoritos toda vez que o usuario abre a tela pelo tabbar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configuraTela()
        // configuração e animação progressbar
    configuraPorcentagem()
    }
    
    func configuraPorcentagem() {
        
        DispatchQueue.main.async { //[.repeat, .curveEaseOut, .autoreverse]
            UIView.animate(withDuration: 0.5, delay: 0.3, options: [.curveLinear], animations: {
                self.viewModel.fanzometroPorcentagemDouble { porcentagemDouble in
                    self.progressView.value = CGFloat(porcentagemDouble)
                }
            }, completion: nil)
        }
        
        favoritosCollectionView.reloadData()
        viewModel.fanzometroPorcentagemDouble(completion: { porcentagem in
            self.porcentagemLabel.text = "\(porcentagem) %"
        })
    }
    
}

// collection view dos filmes favoritos
extension Fanzometro: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numeroDeFilmesFavoritos()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"fanzometroCell", for:  indexPath) as? FanzometroCollectionViewCell
        
        let viewModel = viewModel.getViewModel(posicao: indexPath.row)
        
        cell?.customizaCelula(viewModel: viewModel)
        
        return cell ??  UICollectionViewCell()
    }
    
    
    
}

