//
//  API.swift
//  Uallet
//
//  Created by Agustina Ardisana on 29/03/2022.
//

import Foundation

enum APIError: Error {
    case UsuarioIncompleto, PasswordIncompleto, ServerError
}

class API {
    // closure: función tratada como variable, expresión lambda, función anónima, función literal
    
    //Primer ejemplo, más simple
//    static func login(_ usuario: String,
//                      _ password: String,
//                      onFinished: (Bool) -> Void) {
//        if (usuario == "admin" && password == "12345") {
//            onFinished(true)
//        } else {
//            onFinished(false)
//        }
//    }
    
    
//    Con manejo de errores:
    static func login(_ usuario: String, _ password: String, onFinished: (Bool) ->Void) throws {
        
        // abro una base de datos (caso imaginario)
        // database.open()
        defer {
            // cierro la base de datos cuando la función termine
            // database.close()
        }
        
        guard usuario.count >= 4 else {
            throw APIError.UsuarioIncompleto
        }
        
        guard password.count >= 4 else {
            throw APIError.PasswordIncompleto
        }
        
        // asincrónico
        if (usuario == "admin" && password == "12345") {
                    onFinished(true)
                } else {
                    onFinished(false)
                }
    }
}

    
