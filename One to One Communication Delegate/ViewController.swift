//
//  ViewController.swift
//  One to One Communication Delegate
//
//  Created by Atik  on 6/9/23.
//

import UIKit

class ViewController: UIViewController, ProductSelectionDelegate {

    let productImageView = UIImageView()
    let productNameLabel = UILabel()
    let chooseProductButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func didSelectProduct(name: String, productImage: String) {
        productNameLabel.text = name
        productImageView.image = UIImage(named: productImage)
    }

    @IBAction func openSheetPressed(_ sender: UIButton) {
        
        let pageSheetVC = ProductSelectionVC()
        
        pageSheetVC.delegate = self
        
        // Create a Page Sheet
        pageSheetVC.modalPresentationStyle = .pageSheet
        pageSheetVC.sheetPresentationController?.detents = [.medium()]
        pageSheetVC.sheetPresentationController?.prefersGrabberVisible = true
        pageSheetVC.modalTransitionStyle = .coverVertical
        pageSheetVC.preferredContentSize = CGSize(width: 320, height: 400)
        pageSheetVC.view.backgroundColor = UIColor.white
        
        // Present the page sheet view controller
        self.present(pageSheetVC, animated: true, completion: nil)
    }
    
    func setupUI(){
        view.addSubview(productImageView)
        view.addSubview(productNameLabel)
        view.addSubview(chooseProductButton)
        
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        chooseProductButton.translatesAutoresizingMaskIntoConstraints = false
        
        productImageView.image = UIImage(named: "all")
        
        productNameLabel.text = "Apple product Line"
        productNameLabel.textAlignment = .center
        productNameLabel.font = .systemFont(ofSize: 20, weight: .medium)
        productNameLabel.textColor = .darkGray
        
        chooseProductButton.configuration = .tinted()
        chooseProductButton.configuration?.title = "Chosse Product"
        chooseProductButton.configuration?.image = UIImage(systemName: "apple.logo")
        chooseProductButton.configuration?.imagePadding = 8
        chooseProductButton.addTarget(self, action: #selector(openSheetPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            productImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            productImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 225),
            productImageView.widthAnchor.constraint(equalToConstant: 300),
            
            productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 20),
            productNameLabel.centerXAnchor.constraint(equalTo: productImageView.centerXAnchor),
            productNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            productNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            chooseProductButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            chooseProductButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseProductButton.heightAnchor.constraint(equalToConstant: 50),
            chooseProductButton.widthAnchor.constraint(equalToConstant: 260)
        ])
        
    }
}

