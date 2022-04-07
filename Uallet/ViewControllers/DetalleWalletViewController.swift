//
//  DetalleWalletViewController.swift
//  Uallet
//
//  Created by Agustina Ardisana on 06/04/2022.
//

import UIKit

class DetalleWalletViewController: UIViewController {
    
    var wallet: Wallet?
    
    @IBOutlet weak var lblMoneda: UILabel!
    
    @IBOutlet weak var txtSaldo: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = wallet?.nombre
        lblMoneda.text = wallet?.moneda.rawValue
        let saldo = wallet?.saldo ?? 0
        txtSaldo.text = "\(saldo)"
    }
    
    @IBAction func btnEliminar(_ sender: Any) {
        let alerta = UIAlertController(title: "Eliminar Wallet", message: "¿Estás seguro/a que querés eliminar la wallet? No se puede recuperar", preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "SI, Eliminar", style: .destructive, handler: { _ in
            WalletsStorage.shared.delete(wallet: self.wallet!)
            self.navigationController?.popViewController(animated: true)
        }))
        
        alerta.addAction(UIAlertAction(title: "NO, Cancelar", style: .cancel))
        present(alerta, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        WalletsStorage.shared.editarSaldo(wallet: self.wallet!, saldo: Double(txtSaldo.text!) ?? 0)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
