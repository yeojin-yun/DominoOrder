//
//  BeverageViewController.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/24.
//

import UIKit

class BeverageViewController: UIViewController {
    
    let beverage: [Product] = [
        Product(productTitle: "코카콜라", productImg: UIImage(named: "코카콜라.jpg")!, productSubText: "1,000원"),
        Product(productTitle: "코카콜라 제로", productImg: UIImage(named: "코카콜라 제로.jpg")!, productSubText: "1,000원"),
        Product(productTitle: "스프라이트", productImg: UIImage(named: "스프라이트.jpg")!, productSubText: "1,000원"),
        Product(productTitle: "미닛메이드 스파클링 청포도", productImg: UIImage(named: "미닛메이드 스파클링 청포도.jpg")!, productSubText: "1,000원")
    ]
    
    let productTable: UITableView = {
        let productTable = UITableView()
        productTable.rowHeight = 120
        return productTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "음료"
        setBasics()
        setLayout()
    }
}



extension BeverageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beverage.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTable.dequeueReusableCell(withIdentifier: ProductTableViewCell.cellID, for: indexPath) as! ProductTableViewCell
        
        cell.productImg.image = beverage[indexPath.row].productImg
        cell.productTitle.text = beverage[indexPath.row].productTitle
        cell.productSubText.text = beverage[indexPath.row].productSubText
        
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "코카콜라.jpg")
            detail.title = "코카콜라"
            
        case 1:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "코카콜라 제로.jpg")
            detail.title = "코카콜라 제로"
            
        case 2:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "스프라이트.jpg")
            detail.title = "스프라이트"
            
        case 3:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "미닛메이드 스파클링 청포도.jpg")
            detail.title = "미닛메이드 스파클링 청포도"
            
        default:
            break
        }
    }
}


//MARK: -UI
extension BeverageViewController {
    
    final private func setBasics() {
        view.addSubview(productTable)
        productTable.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.cellID)
        productTable.delegate = self
        productTable.dataSource = self
    }
    final private func setLayout() {
        productTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            productTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            productTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
