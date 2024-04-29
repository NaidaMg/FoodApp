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
//        showMainFlow()
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
    
    
// MARK: - инициализация координаторов
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "swirl.circle.righthalf.filled"), tag: 0)
        homeCoordinator.finishDelegate = self
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        orderNavigationController.tabBarItem = UITabBarItem(title: "Order", image: UIImage.init(systemName: "swirl.circle.righthalf.filled"), tag: 0)
        orderCoordinator.finishDelegate = self
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController)
        listNavigationController.tabBarItem = UITabBarItem(title: "List", image: UIImage.init(systemName: "swirl.circle.righthalf.filled"), tag: 0)
        listCoordinator.finishDelegate = self
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "swirl.circle.righthalf.filled"), tag: 0)
        profileCoordinator.finishDelegate = self
        profileCoordinator.start()
        
// MARK: - добавляем всех в массив координаторов
        
        addChildCoordinators(homeCoordinator)
        addChildCoordinators(orderCoordinator)
        addChildCoordinators(listCoordinator)
        addChildCoordinators(profileCoordinator)
        
        let tabBarControllers = [homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        
        navigationController.pushViewController(tabBarController, animated: true)
        
        
        
        
       
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
