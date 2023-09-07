//
//  ProductSelectionVC.swift
//  One to One Communication Delegate
//
//  Created by Atik  on 6/9/23.
//

import UIKit

protocol ProductSelectionDelegate {
    func didSelectProduct(name: String, productImage: String)
}

class ProductSelectionVC: UIViewController {
    
    var delegate: ProductSelectionDelegate?

    let phoneButton = UIButton()
    let laptopButton = UIButton()
    let iPadButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @objc func phoneButtonTapped() {
        
        delegate?.didSelectProduct(name: "iPhpne 15", productImage: "iphone15")
        
        dismiss(animated: true)
    }

    @objc func laptopButtonTapped() {
        print("laptopButtonTapped Tappde")
        delegate?.didSelectProduct(name: "Macbook M2", productImage: "macm2")
        
        dismiss(animated: true)
    }

    @objc func iPadButtonTapped() {
        print("iPadButtonTapped Tappde")
        delegate?.didSelectProduct(name: "iPad 8Gen", productImage: "ipad8")
        
        dismiss(animated: true)
    }
    
    func setupUI(){
        view.addSubview(phoneButton)
        view.addSubview(laptopButton)
        view.addSubview(iPadButton)
        view.backgroundColor = .systemBackground
        
        phoneButton.translatesAutoresizingMaskIntoConstraints = false
        laptopButton.translatesAutoresizingMaskIntoConstraints = false
        iPadButton.translatesAutoresizingMaskIntoConstraints = false
        
        phoneButton.configuration = .tinted()
        phoneButton.configuration?.title = "Phone"
        phoneButton.configuration?.image = UIImage(systemName: "iphone")
        phoneButton.configuration?.imagePadding = 8
        phoneButton.configuration?.baseForegroundColor = .systemBlue
        phoneButton.configuration?.baseBackgroundColor = .systemBlue
        phoneButton.addTarget(self, action: #selector(phoneButtonTapped), for: .touchUpInside)
        
        laptopButton.configuration = .tinted()
        laptopButton.configuration?.title = "Laptop"
        laptopButton.configuration?.image = UIImage(systemName: "laptopcomputer")
        laptopButton.configuration?.imagePadding = 8
        laptopButton.configuration?.baseForegroundColor = .systemBlue
        laptopButton.configuration?.baseBackgroundColor = .systemBlue
        laptopButton.addTarget(self, action: #selector(laptopButtonTapped), for: .touchUpInside)
        
        iPadButton.configuration = .tinted()
        iPadButton.configuration?.title = "iPad"
        iPadButton.configuration?.image = UIImage(systemName: "ipad")
        iPadButton.configuration?.imagePadding = 8
        iPadButton.configuration?.baseForegroundColor = .systemBlue
        iPadButton.configuration?.baseBackgroundColor = .systemBlue
        iPadButton.addTarget(self, action: #selector(iPadButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            phoneButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            phoneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            phoneButton.heightAnchor.constraint(equalToConstant: 50),
            phoneButton.widthAnchor.constraint(equalToConstant: 280),
            
            laptopButton.bottomAnchor.constraint(equalTo: phoneButton.topAnchor, constant: 120),
            laptopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            laptopButton.heightAnchor.constraint(equalToConstant: 50),
            laptopButton.widthAnchor.constraint(equalToConstant: 280),
            
            iPadButton.bottomAnchor.constraint(equalTo: phoneButton.topAnchor, constant: 190),
            iPadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iPadButton.heightAnchor.constraint(equalToConstant: 50),
            iPadButton.widthAnchor.constraint(equalToConstant: 280),
        ])
    }
}
