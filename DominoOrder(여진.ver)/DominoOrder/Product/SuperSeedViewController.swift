//
//  SuperSeedViewController.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/24.
//

import UIKit

class SuperSeedViewController: UIViewController {
    let SuperSeedPizza: [Product] = [
        Product(productTitle: "우리 고구마", productImg: UIImage(named: "우리 고구마.jpg")!, productSubText: "25,000원"),
        Product(productTitle: "콰트로 치즈 퐁듀", productImg: UIImage(named: "콰트로 치즈 퐁듀.jpg")!, productSubText: "28,000원"),
        Product(productTitle: "알로하 하와이안", productImg: UIImage(named: "알로하 하와이안.jpg")!, productSubText: "23,000원"),
        Product(productTitle: "글램핑 바비큐", productImg: UIImage(named: "글램핑 바비큐.jpg")!, productSubText: "30,000원")
    ]
    
    let productTable: UITableView = {
        let productTable = UITableView()
        productTable.rowHeight = 120
        return productTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "슈퍼시드 피자"
        setBasics()
        setLayout()
    }
}



extension SuperSeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SuperSeedPizza.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTable.dequeueReusableCell(withIdentifier: ProductTableViewCell.cellID, for: indexPath) as! ProductTableViewCell
        cell.productImg.image = SuperSeedPizza[indexPath.row].productImg
        cell.productTitle.text = SuperSeedPizza[indexPath.row].productTitle
        cell.productSubText.text = SuperSeedPizza[indexPath.row].productSubText
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "우리 고구마.jpg")
            detail.title = "우리 고구마"
            
        case 1:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "콰트로 치즈 퐁듀.jpg")
            detail.title = "콰트로 치즈 퐁듀"
            
        case 2:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "알로하 하와이안.jpg")
            detail.title = "알로하 하와이안"
            
        case 3:
            let detail = DetailViewController()
            self.navigationController?.pushViewController(detail, animated: true)
            DetailViewController.imageView.image = UIImage(named: "글램핑 바비큐.jpg")
            detail.title = "글램핑 바비큐"
        default:
            break
        }
        
    }
    
}


//MARK: -UI
extension SuperSeedViewController {
    
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
