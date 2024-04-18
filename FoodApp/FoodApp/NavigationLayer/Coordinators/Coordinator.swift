//
//  Coordinator.swift
//  FoodApp
//
//  Created by Наида Магомаева on 16.04.2024.
//

import UIKit

enum CoordinatorsType {
    case app
    case onboarding
    case home
    case order
    case list
    case profile
    
}


protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var type: CoordinatorsType { get }
    var navigationController : UINavigationController? { get set }
    var finishDelegate: CoordinatorFinishDelegate? { get set }
     
    func start()
    func finish()
}

extension CoordinatorProtocol {
    func addChildCoordinators(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators.append(childCoordinator)
    }
    func remove(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
        
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorsDidFinish(childCoordinators: CoordinatorProtocol)
    
}
