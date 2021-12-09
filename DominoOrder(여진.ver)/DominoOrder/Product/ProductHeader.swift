//
//  ProductHeader.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/23.
//

import UIKit

class ProductHeader: UITableViewHeaderFooterView {

    
    let image = UIImageView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            image.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
