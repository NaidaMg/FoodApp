//
//  AppCoordinator.swift
//  FoodApp
//
//  Created by Наида Магомаева on 19.04.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    override func start() {
        showOnboardingFlow()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}


// MARK: - Navigation methods

private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: self)
        addChildCoordinators(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    func showMainFlow() {
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorsDidFinish(childCoordinators: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinators)
    
        switch childCoordinators.type {
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
     
    
    
}