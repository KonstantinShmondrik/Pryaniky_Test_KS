//
//  SceneDelegate.swift
//  PryanikyTest_KS
//
//  Created by Константин Шмондрик on 27.05.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var startManager: StartManager?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window

        self.startManager = StartManager(window: self.window)
        self.startManager?.start()
        
    }

    


}

