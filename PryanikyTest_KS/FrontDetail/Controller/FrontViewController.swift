//
//  FrontViewController.swift
//  PryanikyTest_KS
//
//  Created by Константин Шмондрик on 27.05.2022.
//

import UIKit
import SDWebImage

class FrontViewController: UIViewController {
    
    private let frontView = FrontView()
    private var objects = [Objects]() {
        didSet {
            frontView.collectionView.reloadData()
        }
    }
    
    var viewModel: FrontViewModel? {
        didSet {
            viewModel?.dataDidSet = { [weak self] objects in
                self?.objects = objects
            }
        }
    }
    
    override func loadView() {
        view = frontView
    }
    
    //    MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        frontView.collectionView.delegate = self
        frontView.collectionView.dataSource = self
        viewModel?.loadData()
    }
    
}
// MARK: - CollectionView setup

extension FrontViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        objects.count
    }
    
    //MARK: - cellForItemAt
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch objects[indexPath.row].name {
            
        case .hz:
            guard let cell = frontView.collectionView.dequeueReusableCell(withReuseIdentifier: HzCollectionViewCell.reuseIdentifier, for: indexPath) as? HzCollectionViewCell else { return UICollectionViewCell() }
            
            cell.label.text = objects[indexPath.row].data.text
            return cell
            
        case.picture:
            
            guard let cell = frontView.collectionView.dequeueReusableCell(withReuseIdentifier: PictureCollectionViewCell.reuseIdentifier, for: indexPath) as? PictureCollectionViewCell else { return UICollectionViewCell() }
            
            let urlString = (objects[indexPath.row].data.url) ?? ""
            let lable = objects[indexPath.row].data.text ?? ""
            
            cell.label.text = objects[indexPath.row].data.text
            cell.config(logo: urlString, lable: lable)
            return cell
            
        case .selector:
            
            guard let cell = frontView.collectionView.dequeueReusableCell(withReuseIdentifier: SelectorCollectionViewCell.reuseIdentifier, for: indexPath) as? SelectorCollectionViewCell else { return UICollectionViewCell() }
            
            objects[indexPath.row].data.variants?.forEach {
                
                cell.segmentedControl.insertSegment(action: alertToSelectedVariantInCell(title: $0.text, variant: $0),
                                                    at: $0.id,
                                                    animated: true)
                
            }
            
            //            if let value = cell.segmentedControl.value(forKey: String(objects[indexPath.row].data.selectedID ?? 0)) {
            //                let selectedIndex = value as! Int
            //                cell.segmentedControl.selectedSegmentIndex = selectedIndex
            //            }
            
            //            cell.segmentedControl.selectedSegmentIndex = objects[indexPath.row].data.selectedID ?? 0
            return cell
        }
    }
    
    //    MARK: - didSelectItemAt
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        alertToSelectedElementInCollectionView(title: objects[indexPath.row].name.rawValue)
    }
    
    //    MARK: - Alert
    
    func alertToSelectedVariantInCell(title: String, variant: Variant) -> UIAction {
        
        let alertController = UIAlertController(title: "id: \(variant.id) инициировал событие",
                                                message: nil,
                                                preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alertAction)
        
        
        let action = UIAction(title: title,
                              attributes: .destructive,
                              state: .on,
                              handler: { _ in
            self.present(alertController, animated: true) })
        return action
    }
    
    func alertToSelectedElementInCollectionView(title: String) {
        let alertController = UIAlertController(title: "Объект \(title) инициировал событие",
                                                message: nil,
                                                preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }
    
}



