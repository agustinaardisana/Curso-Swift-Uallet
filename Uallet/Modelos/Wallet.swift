//
//  Wallet.swift
//  Uallet
//
//  Created by Agustina Ardisana on 05/04/2022.
//

import Foundation

struct Wallet: Codable {
    var nombre: String
    var saldo: Double
    var moneda: Monedas
    
    static func == (w1: Wallet, w2: Wallet) -> Bool {
        return w1.nombre == w2.nombre
    }
}
