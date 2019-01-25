//
//  UIView+Extension.swift
//  DemoActivityIndicator
//
//  Created by mihir mehta on 23/01/19.
//

import Foundation
import UIKit

private let notificationDisappearTime:Double = 5.0
private var activityIndicatorCountAssociationKey: UInt8 = 3
private var tagValueAssociationKey: UInt8 = 4
private let viewCornerRadius:CGFloat = 10.0
private let indicatorHeight:CGFloat = 80.0
private let indicatorWidth:CGFloat = indicatorHeight

public extension UIView {
    
    /// Count maintains the number of time activity Indicator is called
    var activityIndicatorCount: Int? {
        get {
            return objc_getAssociatedObject(self, &activityIndicatorCountAssociationKey) as? Int
        }
        set(newValue) {
            objc_setAssociatedObject(self, &activityIndicatorCountAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        }
    }
    /// view.tag value customised
    var tagValue: Int? {
        get {
            return objc_getAssociatedObject(self, &tagValueAssociationKey) as? Int
        }
        set(newValue) {
            objc_setAssociatedObject(self, &tagValueAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        }
    }
    /// function that determines if activity indicator is currently on the screen or not
    ///
    /// - Returns: `true` if activity indicator is present `false` otherwsise
    func isActivityIndicatorAnimating() -> Bool {
        if let tagValue: Int = self.tagValue {
            if let _: UIView = self.viewWithTag(tagValue) {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    func startActivityIndicator(isHidden:Bool = false,withMessage:String = "") {
        
        if isActivityIndicatorAnimating() {
            if let activityIndicatorCount: Int = self.activityIndicatorCount {
                self.activityIndicatorCount = activityIndicatorCount + 1
            } else {
                self.activityIndicatorCount = 0
            }
            
            return
        }
        let container: UIView = UIView()
        if isHidden {
            container.isHidden = true
        }
        let loadingView: UIView = UIView()
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        let messageContainerView:UIView = UIView(frame: CGRect.zero)

        container.frame = self.frame
        container.center = self.center
        container.backgroundColor = UIColor.clear
        
        messageContainerView.translatesAutoresizingMaskIntoConstraints = false
        if !withMessage.isEmpty {
            messageContainerView.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        } else {
            messageContainerView.backgroundColor = UIColor.clear
        }
        messageContainerView.layer.cornerRadius = viewCornerRadius
        messageContainerView.clipsToBounds = true
        
        if !withMessage.isEmpty {
            messageContainerView.addShadow()
            
        }
        loadingView.frame = CGRect(x:0, y:0, width:indicatorWidth, height:indicatorHeight)
        loadingView.center = self.center
        
        if !withMessage.isEmpty {
            loadingView.backgroundColor = UIColor.clear
        } else {
            loadingView.backgroundColor = UIColor.gray
        }
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = viewCornerRadius
        activityIndicator.frame = CGRect(x:0, y:0, width:indicatorWidth/2, height:indicatorHeight/2)
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.center = CGPoint(x:loadingView.frame.size.width / 2, y:loadingView.frame.size.height / 2);
        if !withMessage.isEmpty {
            activityIndicator.color = UIColor.black
        }
        
        loadingView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.heightAnchor.constraint(equalToConstant: indicatorWidth/2),
            activityIndicator.widthAnchor.constraint(equalToConstant: indicatorWidth/2),
            activityIndicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor)
            ])
        
        messageContainerView.addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        let loadingHeight:CGFloat
        let centerY:CGFloat
        if !withMessage.isEmpty {
            loadingHeight = 60
            centerY = -24
        } else {
            loadingHeight = 80
            centerY = 0
        }
        NSLayoutConstraint.activate([
            loadingView.heightAnchor.constraint(equalToConstant: loadingHeight),
            loadingView.widthAnchor.constraint(equalToConstant: loadingHeight),
            loadingView.centerXAnchor.constraint(equalTo: messageContainerView.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: messageContainerView.centerYAnchor, constant: centerY)
            ])
        if !withMessage.isEmpty {
            
            let label:UILabel = UILabel(frame: CGRect.zero)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 15.0)
            label.text = withMessage
            label.numberOfLines = 2
            label.textAlignment = .center
            label.lineBreakMode = .byWordWrapping
            //label.textColor = UIColor.white
            
            messageContainerView.addSubview(label)
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: loadingView.bottomAnchor, constant: 16),
                label.leadingAnchor.constraint(equalTo: messageContainerView.leadingAnchor, constant: 16.0),
                label.trailingAnchor.constraint(equalTo: messageContainerView.trailingAnchor, constant: -16.0),
                messageContainerView.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 16.0)
                
                ])
        } else {
            messageContainerView.bottomAnchor.constraint(equalTo: loadingView.bottomAnchor, constant: 0.0).isActive = true
            loadingView.leadingAnchor.constraint(equalTo: messageContainerView.leadingAnchor, constant: 0.0).isActive = true
            loadingView.trailingAnchor.constraint(equalTo: messageContainerView.trailingAnchor, constant: 0.0).isActive = true
        }
        
        container.addSubview(messageContainerView)
        NSLayoutConstraint.activate([
            messageContainerView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            messageContainerView.centerYAnchor.constraint(equalTo: container.centerYAnchor)
            ])
        
        
        self.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.heightAnchor.constraint(equalTo: self.heightAnchor),
            container.widthAnchor.constraint(equalTo: self.widthAnchor),
            container.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
        
        self.tagValue = Int(arc4random_uniform(UInt32.max))
        container.tag = self.tagValue!
        activityIndicator.startAnimating()
        
        
        self.isUserInteractionEnabled = false
        self.activityIndicatorCount = 1
        
        if !withMessage.isEmpty {
            
            messageContainerView.setNeedsLayout()
            messageContainerView.layoutIfNeeded()
            messageContainerView.layer.shadowPath = UIBezierPath(rect: messageContainerView.bounds).cgPath
        }
    }
    func addShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 10
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    @discardableResult
    func stopActivityIndicator() -> Bool {
        if let activityIndicatorCount: Int = self.activityIndicatorCount {
            self.activityIndicatorCount = activityIndicatorCount - 1
        }
        
        if self.activityIndicatorCount == 0 {
            //if let tagValue:Int = self.tagValue, let containerView:UIView = self.viewWithTag(tagValue) {
            if let containerView:UIView = self.viewWithTag(self.tagValue!) {
                containerView.removeFromSuperview()
                
                self.isUserInteractionEnabled = true
                
                return true
            }
        }
        
        return false
    }
}
