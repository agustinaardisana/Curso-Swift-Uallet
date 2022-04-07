//
//  WalletsStorage.swift
//  Uallet
//
//  Created by Agustina Ardisana on 05/04/2022.
//

import Foundation
import PromiseKit

class WalletsStorage {
    
    //Singleton
    static var shared = WalletsStorage()
    
    var wallets: [Wallet] = []
    
    let KEY_WALLETS = "wallets_json"
    
    private var listeners: [()->Void] = []
    
    init() {
       load()
    }
    
    func actualizarInfo(listener: @escaping ()-> Void) {
        listeners.append(listener)
    }
    
    func load() {
        if let dataJson = UserDefaults.standard.data(forKey: KEY_WALLETS) {
            let decodificar = JSONDecoder()
            do {
                wallets = try decodificar.decode([Wallet].self, from: dataJson)
            } catch {
                print("No se pudo decodificar le JSON")
            }
        }
    }
    
    func notificarActualizaciones() {
        // Hubo cambios en los datos
        save()
        // recorro todos los listeners y los invoco
        for listener in listeners {
            listener()
        }
    }
    
    func save() {
        let codificar = JSONEncoder()
        if let dataJson = try? codificar.encode(wallets) {
            UserDefaults.standard.set(dataJson, forKey: KEY_WALLETS)
        } else {
            print("No se pudo convertir a JSON")
        }
        
    }
    
    func add(nuevaWallet: Wallet) {
        wallets.append(nuevaWallet)
        notificarActualizaciones()
    }
    
    func delete(wallet: Wallet) {
        wallets.removeAll {walletActual in
            return walletActual == wallet
        }
        notificarActualizaciones()
    }
    
    func editarSaldo(wallet: Wallet, saldo: Double) {
        // version imperativa
        for (i, walletActual) in wallets.enumerated() {
            if walletActual == wallet {
                wallets[i].saldo = saldo
            }
        }
        notificarActualizaciones()
    }
    
    func walletsPromise() -> Promise<[Wallet]> {
        return Promise { resolver in
            resolver.fulfill(self.wallets)
        }
    }
    
}
