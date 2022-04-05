//
//  MainTabViewController.swift
//  Uallet
//
//  Created by Agustina Ardisana on 30/03/2022.
//

import UIKit

class MainTabViewController: UITabBarController {
    
    override func loadView() {
        super.loadView()
        
        // SF Symbols
        let homeVC = HomeViewController()
        let homeIcono = UIImage(systemName: "house")
        let homeIconoSeleccionado = UIImage(systemName: "house.fill")
        let homeNavigationVC = UINavigationController(rootViewController: homeVC)
        homeNavigationVC.tabBarItem = UITabBarItem(title: "home", image: homeIcono, selectedImage: homeIconoSeleccionado)
        
        let dashboardVC = DashboardsViewController()
        dashboardVC.title = "Dashboard"
        let dashboardIcono = UIImage(systemName: "chart.pie")
        let dashboardIconoSeleccionado = UIImage(systemName: "chart.pie.fill")
        let dashboardNavigationVC = UINavigationController(rootViewController: dashboardVC)
        dashboardNavigationVC.tabBarItem = UITabBarItem(title: "Dashboard", image: dashboardIcono, selectedImage: dashboardIconoSeleccionado)
        
        let infoVC = InfoViewController()
        infoVC.title = "Info"
        let infoIcono = UIImage(systemName: "info.circle")
        let infoIconoSeleccioando = UIImage(systemName: "info.circle.fill")
        let infoNavigationVC = UINavigationController(rootViewController: infoVC)
        infoNavigationVC.tabBarItem = UITabBarItem(title: "Info", image: infoIcono, selectedImage: infoIconoSeleccioando)
        
        let walletsVC = WalletsViewController()
        walletsVC.title = "Wallets"
        let walletIcono = UIImage(systemName: "creditcard")
        let walletIconoSeleccionado = UIImage(systemName: "creditcard.fill")
        let walletNavigationVC = UINavigationController(rootViewController: walletsVC)
        walletNavigationVC.tabBarItem = UITabBarItem(title: "Wallets", image: walletIcono, selectedImage: walletIconoSeleccionado)
        
        
        self.viewControllers = [homeNavigationVC, dashboardNavigationVC, infoNavigationVC, walletNavigationVC]
        

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
