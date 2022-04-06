//
//  Monedas.swift
//  Uallet
//
//  Created by Agustina Ardisana on 05/04/2022.
//

import Foundation

enum Monedas: String, Codable {
    case Pesos = "ARS"
    case Dólares = "USD"
    case Bitcoin = "BTC"
    
    static func elegirMonedaSegun(index: Int) -> Monedas {
        switch index {
        case 0:
            return .Pesos
        case 1:
            return .Dólares
        default:
            return .Bitcoin
        }
    }
}
