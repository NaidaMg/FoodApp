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
    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
        
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorsDidFinish(childCoordinators: CoordinatorProtocol)
}

//MARK: TabBar

protocol TabBarCoordinator: AnyObject, CoordinatorProtocol {
    var tabBarCoordinator: UITabBarController? { get set }
}


//MARK: Реализация / Инициализация

class Coordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol]
    var type: CoordinatorsType
    var navigationController: UINavigationController?
    var finishDelegate: CoordinatorFinishDelegate?
    
    init(childCoordinators: [CoordinatorProtocol] = [CoordinatorProtocol](), type: CoordinatorsType, navigationController: UINavigationController? = nil, finishDelegate: CoordinatorFinishDelegate? = nil) {
        self.childCoordinators = childCoordinators
        self.type = type
        self.navigationController = navigationController
        self.finishDelegate = finishDelegate
    }
    
    deinit {
        print("Coordinator deinited \(type)")
              childCoordinators.forEach { $0.finishDelegate = nil }
              childCoordinators.removeAll()
    }
    func start() {
        print("Coordinator start")
    }
    
    func finish() {
        print("Coordinator finish")
    }
    
    
}
