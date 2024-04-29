//
//  HomeCoordinator.swift
//  FoodApp
//
//  Created by Наида Магомаева on 23.04.2024.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    override func start() {
    let vc = ViewController()
        vc.view.backgroundColor = .brown
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
