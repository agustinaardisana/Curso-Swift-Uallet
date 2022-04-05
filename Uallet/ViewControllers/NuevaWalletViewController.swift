//
//  NuevaWalletViewController.swift
//  Uallet
//
//  Created by Agustina Ardisana on 30/03/2022.
//

import UIKit

class NuevaWalletViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Agregar Nueva Wallet"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Guardar", style: .plain, target: self, action: #selector(guardarNuevaWallet))

    }
    
    @IBOutlet weak var txtFieldNombreWallet: UITextField!
    @IBOutlet weak var txtFieldSaldo: UITextField!
    
    @objc func guardarNuevaWallet() {
        let nuevoNombre = txtFieldNombreWallet.text
        let nuevoSaldo = txtFieldSaldo.text
        dismiss(animated: true)
    }
    
    @IBAction func segContMonedas(_ sender: Any) {
//        traer el valor del segmento
    }
    
}
