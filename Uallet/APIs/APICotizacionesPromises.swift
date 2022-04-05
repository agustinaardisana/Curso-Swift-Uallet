//
//  APICotizacionesPromises.swift
//  Uallet
//
//  Created by Agustina Ardisana on 04/04/2022.
//

import Foundation
import Alamofire
import PromiseKit

class APICotizaciones {
    static func cotizacionBitcoinPromesa() -> Promise<Double> {
        return Promise {
            resolver in
            AF.request("http://api.coindesk.com/v1/bpi/currentprice.json")
                .responseDecodable(of: APIBitcoinRespuesta.self) {
                    respuesta in
                    if let valor = respuesta.value {
                        let cotizacion = valor.bpi.usd.rateFloat
                        // cumple con la promesa
                        resolver.fulfill(cotizacion)
                    } else {
                        // rechaza la promesa
                        resolver.reject(APIError.ServerError)
                    }
                    
                }
        }
    }
    
    static func cotizacionDolarPromesa() -> Promise<Double> {
        return Promise {
            resolver in
            AF.request("http://api-dolar-argentina.herokuapp.com/api/dolaroficial")
                .responseDecodable(of: APIDolarRespuesta.self) {
                    respuesta in
                    if let valor = respuesta.value {
                        if let cotizacion = Double(valor.compra){
                            // cumple con la promesa
                            resolver.fulfill(cotizacion)
                        } else {
                            resolver.reject(APIError.ServerError)
                        }
                    } else {
                        // rechaza la promesa
                        resolver.reject(APIError.ServerError)
                    }
                    
                }
        }
    }
    
}
