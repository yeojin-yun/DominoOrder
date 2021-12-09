//
//  DetailViewController.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/23.
//

import UIKit



class DetailViewController: UIViewController {
   
    

    static let imageView = UIImageView()
    let quantityLbl = UILabel()
    let upBtn = UIButton()
    let downBtn = UIButton()
    var totalQuantity = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(rightButtonTapped(_:)))
        
        setBasics()
        setLayout()
    }
}


extension DetailViewController {
    @objc func upBtnTapped(_ sender: UIButton) {
        totalQuantity += 1
        quantityLbl.text = String(totalQuantity) + "개"
    }
    
    
    @objc func downBtnTapped(_ sender: UIButton) {
        if totalQuantity > 0 {
        totalQuantity -= 1
        quantityLbl.text = String(totalQuantity) + "개"
        }
    }
    
    
    @objc func rightButtonTapped(_ sender: UIBarButtonItem) {
        if totalQuantity > 0 {
            if let selectedItem = self.navigationController?.navigationBar.topItem?.title {
                if !OrderManager.shared.wishDictionary.keys.contains(selectedItem) {
                OrderManager.shared.wishDictionary[selectedItem] = totalQuantity
                dictionarySetting()

              } else {
                OrderManager.shared.wishDictionary[selectedItem]! += totalQuantity
                dictionarySetting()
                }
            }
        }
    }
    
    
    func dictionarySetting() {
        let keysArray = Array(OrderManager.shared.wishDictionary.keys)
        OrderManager.shared.keysDictionary = keysArray
        let valuesArray = Array(OrderManager.shared.wishDictionary.values)
        OrderManager.shared.valuesDictionary = valuesArray
    }
    
    
    func setBasics() {
        quantityLbl.text = "0개"
        quantityLbl.textColor = .white
        quantityLbl.backgroundColor = .gray
        quantityLbl.font = UIFont.boldSystemFont(ofSize: 25)
        quantityLbl.textAlignment = .center
        
        
        upBtn.setTitle("+", for: .normal)
        downBtn.setTitle("-", for: .normal)
        
        [upBtn, downBtn].forEach {
            $0.setTitleColor(.gray, for: .normal)
            $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.gray.cgColor
        }
        

        upBtn.addTarget(self, action: #selector(upBtnTapped(_:)), for: .touchUpInside)
        downBtn.addTarget(self, action: #selector(downBtnTapped(_:)), for: .touchUpInside)
    }
    
    
    func setLayout() {
        
        let stack = UIStackView(arrangedSubviews: [downBtn, quantityLbl, upBtn])
        stack.axis = .horizontal
        stack.spacing = 0
        
        
        view.addSubview(stack)
        view.addSubview(DetailViewController.imageView)
        
        [DetailViewController.imageView, stack].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([

            DetailViewController.imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            DetailViewController.imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            DetailViewController.imageView.topAnchor.constraint(equalTo: (view.safeAreaLayoutGuide.topAnchor), constant: 70),
            DetailViewController.imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150),
            
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            stack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            quantityLbl.widthAnchor.constraint(equalToConstant: 150),
            upBtn.widthAnchor.constraint(equalToConstant: 40),
            downBtn.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}


