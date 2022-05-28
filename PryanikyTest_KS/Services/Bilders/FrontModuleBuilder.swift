//
//  ModuleBuilder.swift
//  PryanikyTest_KS
//
//  Created by Константин Шмондрик on 27.05.2022.
//

import UIKit
import Alamofire

final
class FrontModuleBuilder {
    
    static func bild() -> UIViewController {
        
        let url = "https://pryaniky.com/static/json/sample.json"
        
        let view = FrontViewController()
        let networkService = AF.request(url, method: .get)
        let viewModel = FrontViewModel(networkService: networkService)
        
        view.viewModel = viewModel
        
        return view
    }
}
