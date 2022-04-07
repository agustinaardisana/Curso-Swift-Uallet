//
//  DashboardsViewController.swift
//  Uallet
//
//  Created by Agustina Ardisana on 29/03/2022.
//

import UIKit
import PromiseKit

class DashboardsViewController: UIViewController {

    @IBOutlet weak var txtSaldoTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actualizarSaldoTotal()
        
        WalletsStorage.shared.actualizarInfo {
            self.actualizarSaldoTotal() //por si cambian las cotizaciones
        }
    }
    
    func actualizarSaldoTotal() {
        firstly {
            when(fulfilled: APICotizaciones.cotizacionDolarPromesa(), APICotizaciones.cotizacionBitcoinPromesa(),
                 WalletsStorage.shared.walletsPromise())
        }
        .done { (cotizacionDolar, cotizacionBitcoin, wallets) in
            var suma = 0.0
            for wallet in wallets {
                switch wallet.moneda {
                case .Pesos:
                    suma += wallet.saldo / cotizacionDolar
                case .Dólares:
                    suma += wallet.saldo
                case .Bitcoin:
                    suma += wallet.saldo * cotizacionBitcoin
                }
            }
            self.txtSaldoTotal.text = "\(Int(suma))"
        }
        .catch { error in
            self.txtSaldoTotal.text = "Error"
        }
        
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
