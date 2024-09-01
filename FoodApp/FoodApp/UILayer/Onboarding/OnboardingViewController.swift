//
//  OnboardingViewController.swift
//  FoodApp
//
//  Created by Наида Магомаева on 25.04.2024.
//

import UIKit

// MARK: - OnboardingViewController

class OnboardingViewController: UIViewController {
    
    
    // MARK: - Properties
    // массив, который будет хранить в себе другие ViewController
    
    private var pages = [OnboardingScreenViewController]()
    
    
    // MARK: - Views
    // * инициализируем PageViewController,PageController и делаем ссылку на наш Презентер
    
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let pageControl = UIPageControl()
    private let button = UIButton()
    weak var viewOutput: OnboardingViewOutput!
    
    // * при инициализации ViewControllаrа, у нас будет передаваться сюда наши экраны(страницы) и сразу Презентер
    init(pages: [OnboardingScreenViewController] = [OnboardingScreenViewController](), viewOutput: OnboardingViewOutput!) {
        self.pages = pages
        self.viewOutput = viewOutput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
        
    }
}

// MARK: - Button
private extension OnboardingViewController {
    @objc func buttonPressed(){
        switch pageControl.currentPage {
        case 0:
            pageControl.currentPage = 1
            pageViewController.setViewControllers([pages[1]], direction: .forward, animated: true, completion: nil)
            button.setTitle(pages[1].buttonText, for: .normal)
        case 1:
            pageControl.currentPage = 2
            pageViewController.setViewControllers([pages[2]], direction: .forward, animated: true, completion: nil)
            button.setTitle(pages[2].buttonText, for: .normal)
        case 2:
            pageControl.currentPage = 3
            pageViewController.setViewControllers([pages[3]], direction: .forward, animated: true, completion: nil)
            button.setTitle(pages[3].buttonText, for: .normal)
        case 3:
            print("Exit")
        default:
            break
        }
        
    }
}


// MARK: - Layout
// * настраиваем PageViewController

private extension OnboardingViewController {
    func setupLayout(){
        setupPageViewController()
        setupPageControl()
        setupButton()
    }

    
    func setupPageViewController() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.view.backgroundColor = .white
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        /*задаем начальный ViewController*/
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
    }
    
    func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        if let page = pages[0] as? OnboardingScreenViewController {
            let title = page.buttonText
            button.setTitle(title, for: .normal)
        }
        pageControl.isUserInteractionEnabled = false
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45)
        ])
        
    }
    
    func setupButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = AppColors.grey
        button.titleLabel?.font = .Poppins.bold.size(of: 18)
        button.titleLabel?.textColor = AppColors.black
        button.setTitleColor(AppColors.black, for: .normal)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: -44),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}




// MARK: - UIPageViewControllerDataSource --- УТОЧНИЬ У НАСТИ---
//методы показывают, какие контроллеры будут задаваться при переключении

extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingScreenViewController), currentIndex > 0 else  { return nil}
             
            return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingScreenViewController), currentIndex < pages.count - 1 else  { return nil }
        
        return pages[currentIndex + 1]
    }
}

// MARK: - UIPageViewControllerDelegate (!!!! СПРОСИТЬ У НАСТИ 140 стр)

extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = pages.firstIndex(of: pendingViewControllers.first! as! OnboardingScreenViewController) {
            pageControl.currentPage = index
            let page = pages[index]
            let title = page.buttonText
            button.setTitle(title, for: .normal)
                
            }
        }
    }
