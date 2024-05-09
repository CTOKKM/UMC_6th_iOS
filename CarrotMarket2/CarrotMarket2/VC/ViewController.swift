//
//  ViewController.swift
//  CarrotMarket2
//
//  Created by KKM on 5/9/24.
//

import UIKit

class ViewController: UIViewController {
    private let tableView: UITableView = {
        let view = UITableView()
        view.allowsSelection = false
        view.backgroundColor = .clear
        view.separatorStyle = .none
        view.bounces = true
        view.showsVerticalScrollIndicator = true
        view.contentInset = .zero
        view.register(MyTableViewCellOne.self, forCellReuseIdentifier: MyTableViewCellOne.id)
        view.register(MyTableViewCellTwo.self, forCellReuseIdentifier: MyTableViewCellTwo.id)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var items: [MyItem] = [
        .vertical(UIImage(named: "1"), "[급구] 50만원 제공! 쿵야 레스토랑 에서 시식알바 구합니다.^^ - 🧅", "당근알바 · 이벤트", nil, nil, nil, nil, nil ),
        .vertical(UIImage(named: "2"), "에어팟맥스실버", "서울특별시 양천구 · 6일 전", "370,000원", UIImage(named: "heart"),UIImage(named: "chat"),"23", "5"),
        .vertical(UIImage(named: "3"), "에어팟 맥스 스페이스그레이 S급 판매합니다.", "서울특별시 양천구 · 3시간 전", "490,000원", UIImage(named: "heart"),UIImage(named: "chat"),"4", "1"),
        .collection("시원한 여름 간식의 계절 🍧🍦🧊", [
            .horizontal(UIImage(named: "co0"), "키친플라워 DW1201CP", "62,000원"),
            .horizontal(UIImage(named: "co1"), "얼음 트레이 소(얼음판)/개당 판매", "1,000원"),
            .horizontal(UIImage(named: "co2"), "실리콘 얼음틀", "2,000원"),
            .horizontal(UIImage(named: "co3"), "밥바바", "5,000원"),
            .horizontal(UIImage(named: "co4"), "스테인리스 얼음볼", "8,000원"),
            .horizontal(UIImage(named: "co5"), "저소음 제빙기", "170,000원"),
        ]),
        .vertical(UIImage(named: "4"), "[S급] 에어팟 맥스 스페이스 그레이 풀박 판매합니다.", "서울특별시 양천구 · 1일 전", "650,000원", UIImage(named: "heart"),UIImage(named: "chat"), "7", "1"),
        .vertical(UIImage(named: "5"), "아이폰 15프로 블랙티타늄 256기가 새상품", "서울특별시 도봉구 · 1일 전", "1,300,000원", UIImage(named: "heart"),UIImage(named: "chat"), "5", "4"),
        .vertical(UIImage(named: "6"), "아이폰 15 128g 옐로우 자급제 판매합니다", "서울특별시 성북구 · 2일 전", "1,750,000원", UIImage(named: "heart"),UIImage(named: "chat"), "1", "4"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        view.backgroundColor = .white
        self.view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
        ])
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    func configureNavigationBar() {
        let search =  UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"),
            style: .plain,
            target: self,
            action: nil)
        
        let bell =  UIBarButtonItem(
            image: UIImage(systemName: "bell"),
            style: .plain,
            target: self,
            action: nil)
        
        let location = UIBarButtonItem(
            title: "삼선동2가▼",
            image: nil,
            target: self,
            action: nil)
        
        search.tintColor = .black
        bell.tintColor = .black
        location.tintColor = .black
        
        navigationItem.rightBarButtonItems = [search, bell]
        navigationItem.leftBarButtonItem = location
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.items[indexPath.item] {
        case let .vertical(image, name, subname, price, dibimage, chatimage, dib, chat):
            let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCellOne.id, for: indexPath) as! MyTableViewCellOne
            cell.prepare(image: image, name: name, subname: subname, price: price, dibimage: dibimage, chatimage: chatimage, dib: dib, chat: chat)
            return cell
            
        case let .collection(name, items):
            let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCellTwo.id, for: indexPath) as! MyTableViewCellTwo
            cell.prepare(name: name, items: items)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch self.items[indexPath.item] {
        case .vertical:
            return MyTableViewCellOne.cellHeight
            
        case .collection:
            return MyTableViewCellTwo.cellHeight
        }
    }
}
