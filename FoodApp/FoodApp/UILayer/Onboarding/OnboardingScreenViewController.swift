//
//  OnboardingScreenViewController.swift
//  FoodApp
//
//  Created by Наида Магомаева on 30.04.2024.
//

import UIKit

class OnboardingScreenViewController: UIViewController {
    
 // MARK: - Properties

// делаем опциональную и вычисляемую проперти, которая при создании и передачи в неё картинки, будет настраивать картинку в нашем imageView
//** то же самое для других пропертис
    
    var imageToShow: UIImage? {
        didSet {
            imageView.image = imageToShow
        }
    }
    
     var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
      var descriptionText: String? {
          didSet {
              descriptionLabel.text = descriptionText
          }
    }
  
    var buttonText: String?
    
 // MARK: - Views
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    
  // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
    }
    
}

// MARK: - Layout - настройка всех элементов

    private extension OnboardingScreenViewController {
        func setupLayout() {
            setupView()
            setupImageView()
            setupTitleLabel()
            setupDescriptionLabel()
        }
        
        func setupView() {
            view.backgroundColor = AppColors.accentOrange
        }
        
        func setupImageView() {
            view.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 200),
                imageView.heightAnchor.constraint(equalToConstant: 200)
            ])
            
            
        }
        
        func setupTitleLabel() {
            view.addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.font = .Poppins.bold.size(of: 24)
            titleLabel.textColor = AppColors.white
            titleLabel.textAlignment = .center
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
            
        }
        
        func setupDescriptionLabel() {
            view.addSubview(descriptionLabel)
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            descriptionLabel.font = .Poppins.regular.size(of: 14)
            descriptionLabel.textColor = AppColors.white
            descriptionLabel.numberOfLines = 0
            descriptionLabel.textAlignment = .center
            
            
            
            NSLayoutConstraint.activate([
                descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 23),
                descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 71),
                descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -72)
            ])
            
        }
        
    }
