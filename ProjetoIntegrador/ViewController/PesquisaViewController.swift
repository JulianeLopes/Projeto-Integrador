//
//  PesquisaViewController.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/05/30.
//

import UIKit

class PesquisaViewController: UIViewController {
    var filmeProcurado: String?
    
    @IBOutlet weak var pesquisaTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var listaDeFilme: [Filme] = []
    var filmeSelecionado: Filme?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
       
        listaDeFilme = Servico.listaDeFilmes
    }
    
    @IBAction func buscarAction(_ sender: Any) {
        let resultado = Servico.listaDeFilmes.filter ({ filme in
            return filme.titulo.lowercased().contains(pesquisaTextField.text?.lowercased() ?? "")
        })
        if pesquisaTextField.hasText{
            listaDeFilme = resultado
        } else {
            listaDeFilme = Servico.listaDeFilmes
        }
        collectionView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detalheVC = segue.destination as? FilmesDetalhesViewController {
            detalheVC.filmeDestaque = filmeSelecionado
        }
    }
}

extension PesquisaViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        filmeSelecionado = listaDeFilme[indexPath.item]
        performSegue(withIdentifier: "detalhesCell", sender: filmeSelecionado)
    }
}

extension PesquisaViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaDeFilme.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PesquisaCollectionViewCell
        
        celula?.configuraCelula(filme: listaDeFilme[indexPath.item])
        
        return  celula ?? UICollectionViewCell()
    }
   
}
