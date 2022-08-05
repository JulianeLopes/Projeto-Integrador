//
//  SceneDelegate.swift
//  ProjetoIntegrador
//
//  Created by Juliane Lopes Moreira Rodrigues on 25/05/22.
//

import UIKit
import FacebookCore
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        var controller = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateInitialViewController()
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = controller
        window.makeKeyAndVisible()
        self.window = window
        
//        let firebaseAuth = Auth.auth()
//        do {
//            try firebaseAuth.signOut()
//            AccessToken.current = nil
//        } catch let signOutError as NSError {
//            print("Error signing out: %@", signOutError)
//        }
        
     //    analizar se existe o usuario logado, se sim chamar tela Main caso contrario Main Tela Cadastro
        if Auth.auth().currentUser != nil {
            SessionManager.shared.fetchUsuario { error in
                if error == nil {
                    controller = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
                } else {
                    controller = UIStoryboard(name: "Main Tela Cadastro", bundle: nil).instantiateInitialViewController()
                }
               window.rootViewController = controller
            }

        } else {
            controller = UIStoryboard(name: "Main Tela Cadastro", bundle: nil).instantiateInitialViewController()
            window.rootViewController = controller
        }

    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        
        guard let url = URLContexts.first?.url else {
            return
        }
        
        ApplicationDelegate.shared.application(
            UIApplication.shared,
            open: url,
            sourceApplication: nil,
            annotation: [UIApplication.OpenURLOptionsKey.annotation]
        )
    }
 
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    
}

