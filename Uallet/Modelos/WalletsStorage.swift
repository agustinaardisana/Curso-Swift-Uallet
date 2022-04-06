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
    
    let KEY_WALLETS = "wallets_json"
    
    init() {
       load()
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
        print(wallets)
    }
    
    
}
