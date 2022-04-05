//
//  WalletsViewController.swift
//  Uallet
//
//  Created by Agustina Ardisana on 29/03/2022.
//

import UIKit

class WalletsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(agregarWallet))
    }
    
    @objc func agregarWallet() {
        let nuevaWalletVC = NuevaWalletViewController()
        let nuevaWalletNavigationVC = UINavigationController(rootViewController: nuevaWalletVC)
        present(nuevaWalletNavigationVC, animated: true)
    }

}
