//
//  CustomTableViewCell.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let cellId = "CellId"
    
    let menuImg = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // UI 셋팅
    func setUI() {
        [menuImg].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            menuImg.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            menuImg.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            menuImg.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            menuImg.widthAnchor.constraint(equalTo: self.widthAnchor),
            menuImg.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}
