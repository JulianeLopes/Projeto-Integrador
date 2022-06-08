//
//  FavoritoViewController.swift
//  ProjetoIntegrador
//
//  Created by Fernanda Perovano on 29/05/22.
//

import UIKit

class FavoritoViewController: UIViewController {

  
    @IBOutlet weak var listaFavoritoTableView: UITableView!
    
    private var usuarioLogado: Usuario? {
        return SessionManager.shared.usuarioLogado
    }
    
    let viewModel = FavoritoViewModel()
    var filmeSelecionado: Filme?
    var viewModelFavorito = FilmesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaFavoritoTableView.dataSource = self
        listaFavoritoTableView.delegate = self
        viewModelFavorito.delegate = self
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detalhesFilmeVC = segue.destination as? FilmesDetalhesViewController {
            detalhesFilmeVC.filmeDestaque = filmeSelecionado
        }
    }
}

extension FavoritoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numeroDeFilmesFavoritos()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"favoritoCell", for:  indexPath) as? FavoritoTableViewCell
        cell?.customizaCelula(filme: (usuarioLogado?.filmesFavoritos[indexPath.item])!)
        return cell ??  UITableViewCell()
    }
}

extension FavoritoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        filmeSelecionado = viewModel.getItem(row: indexPath.row)
        performSegue(withIdentifier: "favoritoDetalhesFilmeSegue", sender: filmeSelecionado)
    }
}

extension FavoritoViewController: FilmesViewModelDelegate {
    func atualizaFavorito() {
        listaFavoritoTableView.reloadData()
    }
    
    
}
