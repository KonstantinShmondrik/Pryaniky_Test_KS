//
//  PictureCollectionViewCell.swift
//  PryanikyTest_KS
//
//  Created by Константин Шмондрик on 27.05.2022.
//

import UIKit
import SDWebImage

class PictureCollectionViewCell: UICollectionViewCell {
    
    static var reuseIdentifier: String {
        self.description()
    }
    
    let logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = false
        return image
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    private func configureUI() {
        self.addImage()
        self.addLabel()
    }
    
    func addImage() {
        addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor),
            logoImageView.leftAnchor.constraint(equalTo: leftAnchor),
            logoImageView.rightAnchor.constraint(equalTo: rightAnchor),
        ])
    }
    
    func addLabel() {
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5)
        ])
    }
    
    // MARK: - Metods
    func config(logo: String, lable: String){
        self.logoImageView.sd_setImage(with: URL(string:logo))
        self.label.text = lable
    }
}



