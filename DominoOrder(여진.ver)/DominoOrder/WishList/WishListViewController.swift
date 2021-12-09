//
//  WishListViewController.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/22.
//

import UIKit

class WishListViewController: UIViewController {


    
    let wishTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 120
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setNavigation()
        setTable()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        wishTableView.reloadData()
        print(OrderManager.shared.wishDictionary)
    }
}


extension WishListViewController {
    
    // 주문하기
    @objc func rightBtnTapped(_ sender: UIBarButtonItem) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        var orderedMenu = ""
        var orderedPrice = 0
        OrderManager.shared.keysDictionary.forEach { (item) in
            orderedMenu += "\(item)-\(OrderManager.shared.wishDictionary[item] ?? 0)개\n"
            orderedPrice += (OrderManager.shared.wishDictionary[item] ?? 0) * (OrderManager.shared.menuPrice[item] ?? 0)
        }
        let changedPrice = numberFormatter.string(for: orderedPrice)
        let alert = UIAlertController(title: "결제내역", message: "\(orderedMenu)결제금액 : \(changedPrice!)", preferredStyle: .alert)
        let backAction = UIAlertAction(title: "돌아가기", style: .default, handler: nil)
        let buyAction = UIAlertAction(title: "주문하기", style: .default) { [weak self] action in
            OrderManager.shared.wishDictionary = [:]
            self?.wishTableView.reloadData()
        }
        alert.addAction(backAction)
        alert.addAction(buyAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    // 목록 지우기
    @objc func leftBtnTapped(_ sender: UIBarButtonItem) {
        OrderManager.shared.wishDictionary = [:]
        wishTableView.reloadData()
    }
    
    //네비게이션 컨트롤러 셋팅
    func setNavigation() {
        self.navigationItem.title = "WishList"
        self.navigationController?.navigationBar.barTintColor = .white
        view.backgroundColor = .white
        
        let rightBar = UIBarButtonItem(title: "주문", style: .plain, target: self, action: #selector(rightBtnTapped(_:)))
        let leftBar = UIBarButtonItem(title: "목록지우기", style: .plain, target: self, action: #selector(leftBtnTapped(_:)))
        
        self.navigationItem.rightBarButtonItem = rightBar
        self.navigationItem.leftBarButtonItem = leftBar
    }
}


extension WishListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OrderManager.shared.wishDictionary.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = wishTableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.cellID, for: indexPath) as! ProductTableViewCell
        cell.productImg.image = UIImage(named: OrderManager.shared.keysDictionary[indexPath.row])
        
        cell.productTitle.text = String(OrderManager.shared.keysDictionary[indexPath.row])
        
        cell.productSubText.text = "주문수량: \(String(OrderManager.shared.valuesDictionary[indexPath.row]))개"
        
        return cell
    }
    
    
    
    func setTable() {
        view.addSubview(wishTableView)
        wishTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wishTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            wishTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            wishTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            wishTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        wishTableView.delegate = self
        wishTableView.dataSource = self
        wishTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.cellID)
    }
}
