//
//  OnboardingCoordinator.swift
//  FoodApp
//
//  Created by Наида Магомаева on 19.04.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    override func start() {
    let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

