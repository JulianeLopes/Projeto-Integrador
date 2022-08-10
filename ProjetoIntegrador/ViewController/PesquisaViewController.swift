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
    
    let viewModel = PesquisaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        pesquisaTextField.delegate = self
        
        viewModel.getFilmesDaAPI {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    // ação de pesquisar dinamicamente, conforme a ação do usuario
    @IBAction func buscarAction(_ sender: Any) {
        viewModel.pesquisarFilme(filmePesquisado: pesquisaTextField.text)

    }
    // transição de dados entre telas em MVVM
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detalheVC = segue.destination as? FilmesDetalhesViewController {
            detalheVC.filmeDestaque = viewModel.getFilmeSelecionado()
            detalheVC.spoiler = viewModel.getSpoiler()
        }
    }
}
// ação de selecionar o filme em MVVM
extension PesquisaViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selecionarFilme(posicao: indexPath.row)
        performSegue(withIdentifier: "detalhesCell", sender: nil)
    }
}

extension PesquisaViewController: UICollectionViewDataSource{
    // quantidade de itens na lista - funcionando dinamicamente conforme a pesquisa do usuario
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.listaDeFilme.count
    }
    
    // celula customizada em MVVM
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PesquisaCollectionViewCell
        
        let celulaViewModel = viewModel.getCellViewModel(posicao: indexPath.row)
        
        celula?.configuraCelula(viewModel: celulaViewModel)
        
        return  celula ?? UICollectionViewCell()
    }
   
}

extension PesquisaViewController: PesquisaViewModelDelegate {
    func atualizalista() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}


extension PesquisaViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
//        hideKeyBoardWhenTappedAround()
        textField.returnKeyType = .done
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension UIViewController {
    func hideKeyBoardWhenTappedAround() {
        let tapGesture = UIGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
}
