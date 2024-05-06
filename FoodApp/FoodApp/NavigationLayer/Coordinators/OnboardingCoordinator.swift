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
        var pages = [OnboardingScreenViewController]()
               
 // * добавили VC для самого Onboarding -> отправили их в проперти pages -> чтобы передать в инициализатор OnboardingViewController
        
        let firstVC = OnboardingScreenViewController()
        firstVC.imageToShow = UIImage(resource: .chickenLeg1)
        firstVC.titleText = "Delicious Food"
        firstVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        firstVC.buttonText = "Next"
        
        let secondVC = OnboardingScreenViewController()
        secondVC.imageToShow = UIImage(resource: .shipped1)
        secondVC.titleText = "Fast Shipping"
        secondVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        secondVC.buttonText = "Next"
        
        let thirdVC = OnboardingScreenViewController()
        thirdVC.imageToShow = UIImage(resource: .medal1)
        thirdVC.titleText = "Certificate Food"
        thirdVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        thirdVC.buttonText = "Next"

        let finalVC = OnboardingScreenViewController()
        finalVC.imageToShow = UIImage(resource: .creditCard1)
        finalVC.titleText = "Payment Online"
        finalVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        finalVC.buttonText = "Cool"
        
    
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(finalVC)
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }

}
