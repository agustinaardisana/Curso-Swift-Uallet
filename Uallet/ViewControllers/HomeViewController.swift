//
//  HomeViewController.swift
//  Uallet
//
//  Created by Agustina Ardisana on 29/03/2022.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logout))
    
    }
    @objc func logout() {
        UserDefaults.standard.set(false, forKey: "logueado")
        dismiss(animated: true)
    }
}
