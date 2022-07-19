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
    var spoiler: Spoiler?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaFavoritoTableView.dataSource = self
        listaFavoritoTableView.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listaFavoritoTableView.reloadData()
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detalhesFilmeVC = segue.destination as? FilmesDetalhesViewController {
            detalhesFilmeVC.filmeDestaque = filmeSelecionado
            detalhesFilmeVC.spoiler = spoiler
            detalhesFilmeVC.delegate = self
        }
    }
}

extension FavoritoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numeroDeFilmesFavoritos()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier:"favoritoCell", for:  indexPath) as? FavoritoTableViewCell
        let viewModelcell = viewModel.getCellViewModel(posicao: indexPath.item)
        cell?.customizaCelula(viewModel: viewModelcell)
        return cell ??  UITableViewCell()
    }
}

extension FavoritoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        filmeSelecionado = viewModel.getItem(row: indexPath.row)
        spoiler = viewModel.getSpoiler(filme: filmeSelecionado)
        performSegue(withIdentifier: "favoritoDetalhesFilmeSegue", sender: filmeSelecionado)
    }
}

extension FavoritoViewController: FilmesDetalhesViewControllerDelegate {
    func viewWillDisappear() {
        listaFavoritoTableView.reloadData()
    }
}


