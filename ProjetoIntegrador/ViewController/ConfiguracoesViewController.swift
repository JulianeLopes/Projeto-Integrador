//
//  ConfiguracoesViewController.swift
//  ProjetoIntegrador
//
//  Created by Gui  on 31/05/22.
//

import UIKit

class ConfiguracoesViewController: UIViewController {

    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var listaOpcoesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaOpcoesTableView.dataSource = self
    }
}

extension ConfiguracoesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        if let cell = tableView.dequeueReusableCell(withIdentifier: "configuracaoCell", for: indexPath) as? ConfiguracaoTableViewCell {
        //         cell.configuraCelula(UIViewController: <#T##UIViewController#>)
        return UITableViewCell()
    }
}

    
    

