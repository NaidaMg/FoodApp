//
//  OrderCoordinator.swift
//  FoodApp
//
//  Created by Наида Магомаева on 23.04.2024.
//


import UIKit

class OrderCoordinator: Coordinator {
    
    override func start() {
    let vc = ViewController()
        vc.view.backgroundColor = .purple
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
