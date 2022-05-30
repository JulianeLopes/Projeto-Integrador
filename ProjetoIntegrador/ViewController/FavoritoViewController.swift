//
//  FavoritoViewController.swift
//  ProjetoIntegrador
//
//  Created by Fernanda Perovano on 29/05/22.
//

import UIKit

class FavoritoViewController: UIViewController {

  
    @IBOutlet weak var listaFavoritoTableView: UITableView!
    let viewModel = FanzometroViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaFavoritoTableView.dataSource = self
    }
}

extension FavoritoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numeroDeFilmesFavoritos()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"favoritoCell", for:  indexPath) as? FavoritoTableViewCell
        cell?.customizaCelula(filme: ServicoDeUsuario.user.filmesFavoritos[indexPath.item] )
        return cell ??  UITableViewCell()
    }
}
