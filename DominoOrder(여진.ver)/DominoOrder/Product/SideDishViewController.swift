//
//  SideDishViewController.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/24.
//

import UIKit

class SideDishViewController: UIViewController {
    
    let sideDish: [Product] = [
        Product(productTitle: "딸기 슈크림", productImg: UIImage(named: "딸기 슈크림.jpg")!, productSubText: "1,000원"),
        Product(productTitle: "포테이토 순살치킨", productImg: UIImage(named: "포테이토 순살치킨.jpg")!, productSubText: "15,000원"),
        Product(productTitle: "슈퍼곡물 치킨", productImg: UIImage(named: "슈퍼곡물 치킨.jpg")!, productSubText: "15,000원"),
        Product(productTitle: "치킨퐁듀 그라탕", productImg: UIImage(named: "치킨퐁듀 그라탕.jpg")!, productSubText: "12,000원"),
        Product(productTitle: "퀴노아 치킨 샐러드", productImg: UIImage(named: "퀴노아 치킨 샐러드.jpg")!, productSubText: "13,000원"),
        Product(productTitle: "애플 크러스트 디저트", productImg: UIImage(named: "애플 크러스트 디저트.jpg")!, productSubText: "4,000원")
    ]
    
    let productTable: UITableView = {
        let productTable = UITableView()
        productTable.rowHeight = 120
        return productTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "사이드디시"
        setBasics()
        setLayout()
    }
}



extension SideDishViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideDish.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTable.dequeueReusableCell(withIdentifier: ProductTableViewCell.cellID, for: indexPath) as! ProductTableViewCell
        
        cell.productImg.image = sideDish[indexPath.row].productImg
        cell.productTitle.text = sideDish[indexPath.row].productTitle
        cell.productSubText.text = sideDish[indexPath.row].productSubText
        
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "딸기 슈크림.jpg")
            detail.title = "딸기 슈크림"
            
        case 1:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "포테이토 순살치킨.jpg")
            detail.title = "포테이토 순살치킨"
            
        case 2:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "슈퍼곡물 치킨.jpg")
            detail.title = "슈퍼곡물 치킨"
            
        case 3:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "치킨퐁듀 그라탕.jpg")
            detail.title = "치킨퐁듀 그라탕"
            
        case 4:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "퀴노아 치킨 샐러드.jpg")
            detail.title = "퀴노아 치킨 샐러드"
            
        case 5:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "애플 크러스트 디저트.jpg")
            detail.title = "애플 크러스트 디저트"
            
        default:
            break
        }
        
    }
    
}


//MARK: -UI
extension SideDishViewController {
    
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
