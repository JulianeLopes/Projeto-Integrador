//
//  ConfiguracaoTableViewCell.swift
//  ProjetoIntegrador
//
//  Created by Fernanda Perovano on 06/06/22.
//

import UIKit

class ConfiguracaoTableViewCell: UITableViewCell {

    @IBOutlet weak var labelConfig: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configuraCelula(UIViewController: UIViewController) {
        labelConfig.text = UIViewController.nibName
    }
}
