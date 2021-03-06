//
//  WalletsViewController.swift
//  Uallet
//
//  Created by Agustina Ardisana on 05/04/2022.
//

import UIKit

class WalletsViewController: UITableViewController {
    
    let cellIdentifier = "celdaWallets"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(agregarWallet))
        
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false
        
        // Registrar una celda custom
        let nib = UINib(nibName: "WalletViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        
        // Registro un listener para cuando los datos cambien
        WalletsStorage.shared.actualizarInfo {
            self.tableView.reloadData()
        }
    }
    
    //MARK: Eventos de UI
    
    @objc func agregarWallet() {
        let nuevaWalletVC = NuevaWalletViewController()
        
        // Callback para que aparezca la celda al cerrar el modal
//        nuevaWalletVC.set { grabo in
//            if grabo {
//                self.tableView.reloadData()
//            }
//        }
        let nuevaWalletNavigationVC = UINavigationController(rootViewController: nuevaWalletVC)
        present(nuevaWalletNavigationVC, animated: true)
       }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WalletsStorage.shared.wallets.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                 for: indexPath) as! WalletViewCell
        
        let wallet = WalletsStorage.shared.wallets[indexPath.row]
        
        cell.lblNombre.text = wallet.nombre
        cell.lblSaldo!.text = "\(wallet.saldo)"
        cell.lblMoneda?.text = "(\(wallet.moneda.rawValue))"

        return cell
    }
    
    // MARK: Ir a vista detalle
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let walletSeleccionada = WalletsStorage.shared.wallets[indexPath.row]
        
        let detalleVC = DetalleWalletViewController()
        detalleVC.wallet = walletSeleccionada
        
        navigationController?.pushViewController(detalleVC, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
