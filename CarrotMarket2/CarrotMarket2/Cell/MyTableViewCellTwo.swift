//
//  MyTableViewCellTwo.swift
//  CarrotMarket2
//
//  Created by KKM on 5/9/24.
//

import UIKit

final class MyTableViewCellTwo: UITableViewCell {
    static let id = "MyTableViewCellTwo"
    static let cellHeight = 250.0
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8.0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = .init(width: 130, height: cellHeight)
        return layout
    }()
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = true
        view.contentInset = .zero
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.id)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var items = [CollectionViewItem]()
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.collectionView.dataSource = self
        
        setAddView()
        setLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.prepare(name: nil, items: [])
    }
    
    func prepare(name: String?, items: [CollectionViewItem]) {
        self.label.text = name
        self.items = items
    }
    func setLayout() {
        NSLayoutConstraint.activate([
            self.label.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10),
            self.label.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
        ])
        NSLayoutConstraint.activate([
            self.collectionView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 30),
            self.collectionView.topAnchor.constraint(equalTo: self.label.bottomAnchor),
        ])
    }
    func setAddView() {
        self.contentView.addSubview(self.label)
        self.contentView.addSubview(self.collectionView)
    }
}

extension MyTableViewCellTwo: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch self.items[indexPath.item] {
        case let .horizontal(image, name, price):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.id, for: indexPath) as! MyCollectionViewCell
            cell.prepare(image: image, name: name, price: price)
            return cell
        }
    }
}
