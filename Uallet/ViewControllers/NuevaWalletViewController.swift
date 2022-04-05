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
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cerrarModal))

    }
    
    @IBOutlet weak var txtFieldNombreWallet: UITextField!
    @IBOutlet weak var txtFieldSaldo: UITextField!
    @IBOutlet weak var monedas: UISegmentedControl!
    
    @objc func cerrarModal() {
        dismiss(animated: true)
    }
    
//    func monedaElegida() {
//        if monedas.selectedSegmentIndex == 0 {
//            return .Dólares
//        } else if monedas.selectedSegmentIndex == 1 {
//            return .Bitcoin
//        } else {
//            return .Pesos
//        }
//    }
    
    @objc func guardarNuevaWallet() {
        // Por ahora las arregla al storage de wallets pero no las muestra en pantalla
        let nombreIngresado = txtFieldNombreWallet.text!
        let saldoIngresado = txtFieldSaldo.text!
        
        let nuevaWallet = Wallet(nombre: nombreIngresado, saldo: Double(saldoIngresado)!, moneda: .Pesos)
        WalletsStorage.shared.add(nuevaWallet: nuevaWallet)
        dismiss(animated: true)
    }
    
    
    
}
