//
//  MyCollectionViewCell.swift
//  CarrotMarket2
//
//  Created by KKM on 5/9/24.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    static let id = "MyCollectionViewCell"
    
    private let subThumbnailImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 6
        return view
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setAddView()
        setLayout()
 
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.prepare(image: nil, name: nil, price: nil)
    }
    
    func prepare(image: UIImage?, name: String?, price: String?) {
        self.subThumbnailImageView.image = image
        self.titleLabel.text = name
        self.priceLabel.text = price
    }
    func setLayout() {
        NSLayoutConstraint.activate([
            self.subThumbnailImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.subThumbnailImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.subThumbnailImageView.widthAnchor.constraint(equalToConstant: 120),
            self.subThumbnailImageView.heightAnchor.constraint(equalToConstant: 120),
        ])
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.subThumbnailImageView.bottomAnchor, constant: 10),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.titleLabel.widthAnchor.constraint(equalToConstant: 120)
        ])
        NSLayoutConstraint.activate([
            self.priceLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 2),
            self.priceLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10)
        ])
    }
    func setAddView() {
        self.contentView.addSubview(self.subThumbnailImageView)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.priceLabel)
    }
}
