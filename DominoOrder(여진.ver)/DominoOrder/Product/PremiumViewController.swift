//
//  PremiumViewController.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/24.
//

import UIKit

class PremiumViewController: UIViewController {
    
    let premiumPizza: [Product] = [
        Product(productTitle: "더블크러스트 이베리코", productImg: UIImage(named: "더블크러스트 이베리코.jpg")!, productSubText: "15,000원"),
        Product(productTitle: "와규 앤 비스테카", productImg: UIImage(named: "와규 앤 비스테카.jpg")!, productSubText: "15,000원"),
        Product(productTitle: "블랙타이거 슈림프", productImg: UIImage(named: "블랙타이거 슈림프.jpg")!, productSubText: "15,000원"),
        Product(productTitle: "블랙앵거스 스테이크", productImg: UIImage(named: "블랙앵거스 스테이크.jpg")!, productSubText: "15,000원"),
        Product(productTitle: "직화 스테이크", productImg: UIImage(named: "직화 스테이크.jpg")!, productSubText: "15,000원"),
    ]
    
    let productTable: UITableView = {
        let productTable = UITableView()
        productTable.rowHeight = 120
        return productTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "프리미엄 피자"
        setBasics()
        setLayout()
    }
    
}


extension PremiumViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return premiumPizza.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTable.dequeueReusableCell(withIdentifier: ProductTableViewCell.cellID, for: indexPath) as! ProductTableViewCell
        cell.productImg.image = premiumPizza[indexPath.row].productImg
        cell.productTitle.text = premiumPizza[indexPath.row].productTitle
        cell.productSubText.text = premiumPizza[indexPath.row].productSubText
        
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "더블크러스트 이베리코.jpg")
            detail.title = "더블크러스트 이베리코"
            
        case 1:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "와규 앤 비스테카.jpg")
            detail.title = "와규 앤 비스테카"
            
        case 2:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "블랙타이거 슈림프.jpg")
            detail.title = "블랙타이거 슈림프"
            
        case 3:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "블랙앵거스 스테이크.jpg")
            detail.title = "블랙앵거스 스테이크"
            
        case 4:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "직화 스테이크.jpg")
            detail.title = "직화 스테이크"

        default:
            break
        }
    }
    
}


//MARK: -UI
extension PremiumViewController {
    
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
