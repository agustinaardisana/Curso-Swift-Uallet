//
//  ViewController.swift
//  Uallet
//
//  Created by Agustina Ardisana on 25/03/2022.
//

import UIKit

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "logueado") {
            irAHome(conAnimacion: false)
        }
    }

    @IBOutlet weak var inputNombreUsuario: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    
    let nombreUsuarioAlmacenado = "admin"
    let passwordAlmacenada = "123456"
    let mensajeUsuarioIncorrecto = "El usuario ingresado es incorrecto"
    let mensajePasswordIncorrecto = "La contraseña ingresada es incorrecto"
    
    @IBAction func autocompletar(_ sender: Any) {
        inputNombreUsuario.text = nombreUsuarioAlmacenado
        inputPassword.text = passwordAlmacenada
    }
    @IBAction func gestureCerrarTeclado(_ sender: UITapGestureRecognizer) {
        cerrarTeclado()
    }
    
    func cerrarTeclado() {
        inputNombreUsuario.resignFirstResponder()
        inputPassword.resignFirstResponder()
    }
    
    func vaciarTextFields(){
        inputNombreUsuario.text = ""
        inputPassword.text = ""
    }
    
    func irAHome(conAnimacion: Bool = true){
        let tabVC = MainTabViewController()
        tabVC.modalTransitionStyle = .coverVertical
        tabVC.modalPresentationStyle = .fullScreen
        present(tabVC, animated: conAnimacion)
        
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "logueado")
    }
    
    @IBAction func btnIniciarSesion() {
        // Intentá hacer lo siguiente
        // si llega a generar excepción: NO ME IMPORTA, seguí de largo
        try? API.login("", "") { _ in
            
        }
        
        do {
            print("intentando loguear")
            
            try API.login(inputNombreUsuario.text!, inputPassword.text!) { logueado in
                if logueado {
                    irAHome()
                } else {
                    alertarError("credenciales incorrectas, intente nuevamente")
                    vaciarTextFields()
                }
            }
            
            } catch APIError.UsuarioIncompleto {
                alertarError("Usuario no ingresado")
            } catch APIError.PasswordIncompleto {
                alertarError("Contraseña no ingresada")
            } catch {
                alertarError("Error desconocido")
        }
        
        cerrarTeclado()
    }
    
    func alertarError(_ mensaje: String) {
        let alerta = UIAlertController(title: "Log in", message: mensaje, preferredStyle: .alert)
        
        let botonOK =  UIAlertAction(title: "Aceptar", style: .default)
        
        alerta.addAction(botonOK)
        present(alerta, animated: true)
    }
    
}

