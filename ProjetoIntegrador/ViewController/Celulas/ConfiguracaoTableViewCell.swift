//
//  ConfiguracaoTableViewCell.swift
//  ProjetoIntegrador
//
//  Created by Fernanda Perovano on 06/06/22.
//

import UIKit

protocol ConfiguracaoViewModelDelegate: AnyObject {
    func clicouNoBotao(title: String)
}


class ConfiguracaoTableViewCell: UITableViewCell {

    weak var delegate: ConfiguracaoViewModelDelegate?
    
    @IBOutlet weak var button: UIButton!
    private var titulo: String = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.setTitleColor(.white, for: .normal)
        
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
//        let loginViewController = LoginViewController()
//        present(loginViewController, animated: true)
        delegate?.clicouNoBotao(title: titulo)
    }
    
    func configuraCelula(titulo: String) {
        self.titulo = titulo
        button.setTitle(titulo, for: .normal)
    }
}
