//
//  MyTableViewCellOne.swift
//  CarrotMarket2
//
//  Created by KKM on 5/9/24.
//

import UIKit

final class MyTableViewCellOne: UITableViewCell {
    static let id = "MyTableViewCellOne"
    static let cellHeight = 140.0
    
    private let thumbnailImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 6
        view.contentMode = .scaleAspectFill
        return view
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .lightGray
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
    private let dibImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        return view
    }()
    private let chatImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        return view
    }()
    private let dibLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let chatLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setAddView()
        setLayout()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.prepare(image: nil, name: nil, subname: nil, price: nil, dibimage: nil, chatimage: nil, dib: nil, chat: nil)
    }
    
    func prepare(image: UIImage?, name: String?, subname: String?, price: String?, dibimage: UIImage?, chatimage: UIImage?, dib: String?, chat: String?) {
        self.thumbnailImageView.image = image
        self.titleLabel.text = name
        self.subtitleLabel.text = subname
        self.priceLabel.text = price
        self.dibImageView.image = dibimage
        self.chatImageView.image = chatimage
        self.dibLabel.text = dib
        self.chatLabel.text = chat
    }
    func setAddView(){
        self.contentView.addSubview(self.thumbnailImageView)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.subtitleLabel)
        self.contentView.addSubview(self.priceLabel)
        self.contentView.addSubview(self.dibImageView)
        self.contentView.addSubview(self.chatImageView)
        self.contentView.addSubview(self.dibLabel)
        self.contentView.addSubview(self.chatLabel)
    }
    func setLayout() {
        NSLayoutConstraint.activate([
            self.thumbnailImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.thumbnailImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.thumbnailImageView.widthAnchor.constraint(equalToConstant: 115),
            self.thumbnailImageView.heightAnchor.constraint(equalToConstant: 115),
        ])
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.thumbnailImageView.trailingAnchor, constant: 20),
            self.titleLabel.widthAnchor.constraint(equalToConstant: 250)
        ])
        NSLayoutConstraint.activate([
            self.subtitleLabel.topAnchor.constraint(equalTo:  self.titleLabel.bottomAnchor, constant: 3),
            self.subtitleLabel.leadingAnchor.constraint(equalTo: self.thumbnailImageView.trailingAnchor, constant: 20),
        ])
        NSLayoutConstraint.activate([
            self.priceLabel.topAnchor.constraint(equalTo:  self.subtitleLabel.bottomAnchor, constant: 2),
            self.priceLabel.leadingAnchor.constraint(equalTo: self.thumbnailImageView.trailingAnchor, constant: 20),
        ])
        NSLayoutConstraint.activate([
            self.dibImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
            self.dibImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),
            self.dibImageView.widthAnchor.constraint(equalToConstant: 15),
            self.dibImageView.heightAnchor.constraint(equalToConstant: 15),
        ])
        NSLayoutConstraint.activate([
            self.chatImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
            self.chatImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -70),
            self.chatImageView.widthAnchor.constraint(equalToConstant: 15),
            self.chatImageView.heightAnchor.constraint(equalToConstant: 15),
        ])
        NSLayoutConstraint.activate([
            self.dibLabel.centerYAnchor.constraint(equalTo: self.dibImageView.centerYAnchor),
            self.dibLabel.trailingAnchor.constraint(equalTo: self.dibImageView.trailingAnchor, constant: 15),
        ])
        NSLayoutConstraint.activate([
            self.chatLabel.centerYAnchor.constraint(equalTo: self.chatImageView.centerYAnchor),
            self.chatLabel.trailingAnchor.constraint(equalTo: self.chatImageView.trailingAnchor, constant: 15),
        ])
    }
}

