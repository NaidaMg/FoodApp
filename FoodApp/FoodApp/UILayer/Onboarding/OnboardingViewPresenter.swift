//
//  OnboardingViewPresenter.swift
//  FoodApp
//
//  Created by Наида Магомаева on 25.04.2024.
//

import UIKit



protocol OnboardingViewOutput: AnyObject {
   func onboardingFinish()
}


class OnboardingViewPresenter: OnboardingViewOutput {
  
    
//    MARK: - Properties
//    добавляем презентеру ссылку на координатор
    
    
    weak var coordinator: OnboardingCoordinator!
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    func onboardingFinish() {
        coordinator.finish()
    }
    
}

