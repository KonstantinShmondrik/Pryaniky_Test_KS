//
//  StartManager.swift
//  PryanikyTest_KS
//
//  Created by Константин Шмондрик on 28.05.2022.
//

import UIKit

final class StartManager {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let frontViewController = FrontModuleBuilder.bild()
        window?.rootViewController = frontViewController
        window?.makeKeyAndVisible()
    }
}
