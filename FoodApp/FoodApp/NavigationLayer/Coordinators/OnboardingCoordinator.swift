//
//  OnboardingCoordinator.swift
//  FoodApp
//
//  Created by Наида Магомаева on 19.04.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    override func start() {
        showOnboarding()
    
        
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

private extension OnboardingCoordinator{
    func showOnboarding() {
// * настраиваем OnboardingVC
        var pages = [UIViewController]()
               
 // * добавили 3 тестовых VC ->  отправили их в проперти pages -> чтобы передать в инициализатор OnboardingViewController
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .orange
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .purple
        let thirdVC =  UIViewController()
        thirdVC.view.backgroundColor = .magenta
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }

}
