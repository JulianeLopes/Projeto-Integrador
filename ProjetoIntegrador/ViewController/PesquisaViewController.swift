//
//  PesquisaViewController.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/05/30.
//

import UIKit

class PesquisaViewController: UIViewController {

    
    @IBOutlet weak var pesquisaTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var filmeProcurado: String?
    var filmeSelecionado: Filme?
    
    let viewModel = PesquisaViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
       
        viewModel.getListaDeFilme()
    }
    
    @IBAction func buscarAction(_ sender: Any) {
        viewModel.pesquisarFilme(filmePesquisado: pesquisaTextField.text)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detalheVC = segue.destination as? FilmesDetalhesViewController {
            detalheVC.filmeDestaque = filmeSelecionado
        }
    }
}

extension PesquisaViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        filmeSelecionado = viewModel.listaDeFilme[indexPath.item]
        performSegue(withIdentifier: "detalhesCell", sender: filmeSelecionado)
    }
}

extension PesquisaViewController: UICollectionViewDataSource{
    // quantidade de itens na lista - funcionando dinamicamente conforme a pesquisa do usuario
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.listaDeFilme.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PesquisaCollectionViewCell
        
        celula?.configuraCelula(filme: viewModel.listaDeFilme[indexPath.item])
        
        return  celula ?? UICollectionViewCell()
    }
   
}

extension PesquisaViewController: PesquisaViewModelDelegate {
    func atualizalista() {
        collectionView.reloadData()
    }
}
