//
//  APIBitcoinStruct.swift
//  Uallet
//
//  Created by Agustina Ardisana on 01/04/2022.
//

import Foundation

// MARK: - Welcome
struct APIBitcoinRespuesta: Codable {
    let time: Time
    let disclaimer, chartName: String
    let bpi: Bpi
}

// MARK: - Bpi
struct Bpi: Codable {
    let usd, gbp, eur: Eur

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case gbp = "GBP"
        case eur = "EUR"
    }
}

// MARK: - Eur
struct Eur: Codable {
    let code, symbol, rate, eurDescription: String
    let rateFloat: Double

    enum CodingKeys: String, CodingKey {
        case code, symbol, rate
        case eurDescription = "description"
        case rateFloat = "rate_float"
    }
}

// MARK: - Time
struct Time: Codable {
    let updated: String
    let updatedISO: String
    let updateduk: String
}
