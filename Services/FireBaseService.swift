//
//  FireBaseService.swift
//  ProjetoIntegrador
//
//  Created by Fernanda Perovano on 13/07/22.
//

import Foundation
import UIKit
import FirebaseCore
import GoogleSignIn
import FirebaseAuth

class FireBaseService {
    
    func loginGoogle(presenter: UIViewController, completion: @escaping (GIDGoogleUser?) -> Void) {
    
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: presenter) { [unowned self] user, error in
            
            if let error = error {
                // ...
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                  
                }
                completion(user)
                return
            }
        }
    }
    
 
    
}


