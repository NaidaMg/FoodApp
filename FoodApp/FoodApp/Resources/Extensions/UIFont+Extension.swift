//
//  UIFont+Extension.swift
//  FoodApp
//
//  Created by Наида Магомаева on 14.04.2024.
//

import UIKit

extension UIFont {
    enum Poppins {
        enum black {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Poppins.black, size: size)!
            }
        }
        
        enum blackItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Poppins.blackItalic, size: size)!
            }
        }
        
        enum bold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Poppins.bold, size: size)!
            }
        }
        
        enum boldItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Poppins.boldItalic, size: size)!
            }
        }
        
        enum italic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Poppins.italic, size: size)!
            }
        }
        
        enum light {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Poppins.light, size: size)!
            }
        }
        
        enum lightItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Poppins.lightItalic, size: size)!
            }
        }
        
        enum medium {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Poppins.medium, size: size)!
            }
        }
        
        enum mediumItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Poppins.mediumItalic, size: size)!
            }
        }
        
        enum regular {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Poppins.regular, size: size)!
            }
        }
        
        enum thin {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Poppins.thin, size: size)!
            }
        }
        
    }
    
}

    private extension UIFont {
        enum Constants {
            enum Poppins {
                static let black = "Poppins-Black"
                static let blackItalic = "Poppins-BlackItalic"
                static let bold = "Poppins-Bold"
                static let boldItalic = "Poppins-BoldItalic"
                static let italic = "Poppins-Italic"
                static let light = "Poppins-Light"
                static let lightItalic = "Poppins-LightItalic"
                static let medium = "Poppins-Medium"
                static let mediumItalic = "Poppins-MediumItalic"
                static let regular = "Poppins-Regular"
                static let thin = "Poppins-Thin"
            }
        }
        
    }

