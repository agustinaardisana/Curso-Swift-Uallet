//
//  WalletsStorage.swift
//  Uallet
//
//  Created by Agustina Ardisana on 05/04/2022.
//

import Foundation

class WalletsStorage {
    
    //Singleton
    static var shared = WalletsStorage()
    
    var wallets: [Wallet] = []
    
    init() {
        // wallets hardcodeadas para empezar
        wallets.append(Wallet(nombre: "Ualá", saldo: 10000, moneda: .Pesos))
        wallets.append(Wallet(nombre: "Lemon", saldo: 0.0001, moneda: .Bitcoin))
    }
    
    func add(nuevaWallet: Wallet) {
        wallets.append(nuevaWallet)
        print(wallets)
    }
    
    
}
