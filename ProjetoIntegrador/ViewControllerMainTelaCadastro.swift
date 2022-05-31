//
//  ViewControllerMainTelaCadastro.swift
//  ProjetoIntegrador
//
//  Created by Rafa Saugo on 30/05/22.
//

import UIKit

class ViewControllerMainTelaCadastro: UIViewController {

    @IBAction func labelLoginUser(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()                                                                 

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func buttomSpoiler(_ sender: Any) {
        
        let alerta = UIAlertController(title: "Alerta de Spoiler", message: "Agora é por sua conta e risco!", preferredStyle: UIAlertController.Style.alert)
        
        let telaSpoiler = UIAlertAction(title: "SIM", style: UIAlertAction.Style.default) { (UIAlertAction) in
            
            self.performSegue(withIdentifier: "telaSpoiler", sender: nil)
        }
        
        let telaListaDeFilmes = UIAlertAction(title: "NÃO", style: UIAlertAction.Style.default) { (UIAlertAction) in
            
            self.performSegue(withIdentifier: "telaListaDeFilmes", sender: nil)
        }

        let ok = UIAlertAction(title: "Continuar nesta tela", style: UIAlertAction.Style.default, handler: nil)
        
        alerta.addAction(telaSpoiler)
        alerta.addAction(telaListaDeFilmes)
        alerta.addAction(ok)
        
        self.present(alerta, animated: true, completion: nil)
        
        
    }
    
}
