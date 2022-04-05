//
//  InfoViewController.swift
//  Uallet
//
//  Created by Agustina Ardisana on 29/03/2022.
//

import UIKit
import Alamofire
import PromiseKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(leerCotizaciones))
        
        leerCotizaciones()
    }
    
    @IBOutlet weak var lblDolar: UILabel!
    @IBOutlet weak var lblBitcoin: UILabel!
    
    @objc func leerCotizaciones() {
        lblDolar.text = ""
        lblBitcoin.text = ""
        //arranca animacion loader
        firstly {
            when(fulfilled:
                APICotizaciones.cotizacionBitcoinPromesa(),
                APICotizaciones.cotizacionDolarPromesa()
            )
        }
        .done { rates in
            self.lblBitcoin.text = "$\(rates.0) USD"
            self.lblDolar.text = "$\(rates.1) ARS"
        }
        .catch { error in
            self.lblBitcoin.text = "Error 😬"
            self.lblDolar.text = "Error 😬"
        }
        .finally {
            // parar animacion loader
        }
        
    }
    
    func leerCotizacionessinPromises(){
        leerCotizacionBitcoin()
        leerCotizacionDolar()
    }
    
    func leerCotizacionBitcoin() {
        AF.request("http://api.coindesk.com/v1/bpi/currentprice.json").responseDecodable(of: APIBitcoinRespuesta.self) {
            respuesta in
            if let value = respuesta.value {
                let cotizacion = value.bpi.usd.rateFloat
                print("El bitcoin vale $\(cotizacion)")
                self.lblBitcoin.text = "$\(cotizacion) USD"
            } else {
                print("hubo un error")
            }
        }
    }
    
    func leerCotizacionDolar() {
        AF.request("http://api-dolar-argentina.herokuapp.com/api/dolaroficial").responseDecodable(of: APIDolarRespuesta.self) {
            respuesta in
            if let value = respuesta.value {
                let cotizacion = value.compra
                print("el dólar está a \(cotizacion)")
                self.lblDolar.text = "$\(cotizacion) ARS"
            } else {
                print("hubo un error")
            }
        }
    }
    
    
}
