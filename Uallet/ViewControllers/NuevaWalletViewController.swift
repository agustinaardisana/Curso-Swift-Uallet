//
//  NuevaWalletViewController.swift
//  Uallet
//
//  Created by Agustina Ardisana on 30/03/2022.
//

import UIKit

class NuevaWalletViewController: UIViewController {
    
    //Solución temporal para que las wallets nuevas renderizen
    var callback: ((Bool) -> Void)?
        
    func set(callback: @escaping (Bool)->Void) {
        self.callback = callback
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Agregar Nueva Wallet"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Guardar", style: .plain, target: self, action: #selector(guardarNuevaWallet))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cerrarModal))

    }
    
    @IBOutlet weak var txtFieldNombreWallet: UITextField!
    @IBOutlet weak var txtFieldSaldo: UITextField!
    @IBOutlet weak var monedas: UISegmentedControl!
    
    @objc func cerrarModal() {
        dismiss(animated: true)
    }
    
    @objc func guardarNuevaWallet() {

        let nombreIngresado = txtFieldNombreWallet.text!
        let saldoIngresado = Double(txtFieldSaldo.text!) ?? 0
        let monedaIngresada = Monedas.elegirMonedaSegun(index: monedas.selectedSegmentIndex)
        
        let nuevaWallet = Wallet(nombre: nombreIngresado, saldo: saldoIngresado, moneda: monedaIngresada)
        WalletsStorage.shared.add(nuevaWallet: nuevaWallet)
        
        dismiss(animated: true)
        
        if let callback = callback {
            callback(true)
        }
    }
    
    
    
}
