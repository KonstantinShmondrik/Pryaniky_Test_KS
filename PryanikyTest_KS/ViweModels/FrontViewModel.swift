//
//  FrontViewModel.swift
//  PryanikyTest_KS
//
//  Created by Константин Шмондрик on 27.05.2022.
//

import UIKit
import Alamofire

protocol FrontViewModelProtocol: AnyObject {
    
    var dataDidSet: (([Objects]) -> Void)? { get set }
    func loadData()
}

final class FrontViewModel: FrontViewModelProtocol {
    
    private var networkService: DataRequest
    var dataDidSet: (([Objects]) -> Void)?
    
    private var allObjects = [Objects]() {
        didSet {
            dataDidSet?(allObjects)
        }
    }
    
    func loadData() {
        
        networkService.response { [self] response in
            
            switch response.result {
            
            case .success(let data):
                guard let recievedData = data,
                      let decodedData = try? JSONDecoder().decode(Response.self, from: recievedData) else { return }
                
                allObjects = decodedData.view.compactMap { contentType in
                    decodedData.data.first { $0.name == contentType }
                }
                
                print(response.data?.prettyJSON)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    init(networkService: DataRequest) {
        self.networkService = networkService
    }
}
