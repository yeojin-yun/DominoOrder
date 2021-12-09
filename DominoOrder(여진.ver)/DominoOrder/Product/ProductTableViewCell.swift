//
//  ProductTableViewCell.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    static let cellID = "CellId"
    
    let productTitle = UILabel()
    let productImg = UIImageView()
    let productSubText = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.addSubview(productTitle)
        self.addSubview(productImg)
        self.addSubview(productSubText)
        productSubText.translatesAutoresizingMaskIntoConstraints = false
        productTitle.translatesAutoresizingMaskIntoConstraints = false
        productImg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productImg.leadingAnchor.constraint(equalTo:self.leadingAnchor),
            productImg.widthAnchor.constraint(equalToConstant: 120),
            productImg.heightAnchor.constraint(equalToConstant: 120),
            productImg.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            
            productTitle.leadingAnchor.constraint(equalTo:productImg.trailingAnchor, constant: 15),
            productTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            productSubText.leadingAnchor.constraint(equalTo:productImg.trailingAnchor, constant: 15),
            productSubText.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: 3)
            
        ])
        
        productTitle.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
