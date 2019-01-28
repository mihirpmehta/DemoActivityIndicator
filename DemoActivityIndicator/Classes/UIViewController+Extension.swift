//
//  UIViewController+Extension.swift
//  DemoActivityIndicator
//
//  Created by mihir mehta on 23/01/19.
//

import Foundation
import UIKit

public extension UIViewController {
    
    /// Show Activity Indicator on top of UIViewController
    ///
    /// - Parameters:
    ///   - isHidden: optional set it true if you want activity Indicator to be hidden default set to false,
    ///   - message: optional *text* that will be displayed along with activity indicator
    func showActivityIndicator(isHidden:Bool = false,message:String = "",configuration:ActivityConfiguration = ActivityConfiguration.default) {
        self.view.startActivityIndicator(isHidden:isHidden, withMessage: message,configuration: configuration)
        if let navigationController: UINavigationController = self.navigationController {
            navigationController.navigationBar.isUserInteractionEnabled = false
            navigationController.view.isUserInteractionEnabled = false
        }
    }
    
    /// Hides Activity Indicator which was displayed by calling `showActivityIndicator`
    func hideActivityIndicator() {
        if self.view.stopActivityIndicator() {
            if let navigationController: UINavigationController = self.navigationController {
                navigationController.navigationBar.isUserInteractionEnabled = true
                navigationController.view.isUserInteractionEnabled = true
            }
        }
    }
}

