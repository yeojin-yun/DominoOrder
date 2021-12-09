//
//  CategoryViewController.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/22.
//

import UIKit
import SnapKit


class CategoryViewController: UIViewController {
    
    
    let menu: [Menu] = [
        Menu(menu: UIImage(named: "클래식.png")!),
        Menu(menu: UIImage(named: "프리미엄.png")!),
        Menu(menu: UIImage(named: "슈퍼시드.png")!),
        Menu(menu: UIImage(named: "사이드디시.png")!),
        Menu(menu: UIImage(named: "음료.png")!),
        Menu(menu: UIImage(named: "피클소스.png")!)
    ]
    
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 100
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setBasics()
        self.navigationItem.title = "Domino's"
        //(동일)self.navigationController?.navigationBar.topItem?.title = "Domino's"
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
    
}

//MARK: -UI
extension CategoryViewController {
    final private func setLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
   
        tableView.snp.makeConstraints {
            $0.left.equalTo(view.safeAreaLayoutGuide)
            $0.right.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    final private func setBasics() {
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.cellId)
        tableView.register(ProductHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}


//테이블뷰 셋팅 (delegate, dataSource)
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellId, for: indexPath) as! CustomTableViewCell
        
        cell.menuImg.image = menu[(indexPath.row)].menu
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(ProductViewController(), animated: true)
        case 1:
            self.navigationController?.pushViewController(PremiumViewController(), animated: true)
        case 2:
            self.navigationController?.pushViewController(SuperSeedViewController(), animated: true)
        case 3:
            self.navigationController?.pushViewController(SideDishViewController(), animated: true)
        case 4:
            self.navigationController?.pushViewController(BeverageViewController(), animated: true)
        case 5:
            self.navigationController?.pushViewController(PickleSourceViewController(), animated: true)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! ProductHeader
        view.image.image = UIImage(named: "logo.png")
        return view

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
}

