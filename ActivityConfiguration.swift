//
//  ActivityConfiguration.swift
//  DemoActivityIndicator
//
//  Created by mihir mehta on 25/01/19.
//

import Foundation

public class ActivityConfiguration {
    var indicatorColor:UIColor = UIColor.white
    var indicatorColorWithMessage:UIColor = UIColor.black
    var messageBackgroundColor:UIColor = UIColor.white
    var messageTextColor:UIColor = UIColor.black
    var indicatorBackGroundColor = UIColor.gray
    
    /// Configuration for Activity Indicator
    ///
    /// - Parameters:
    ///   - indicatorColor: Indicator Color `default` white
    ///   - indicatorColorWithMesssage: IndicatorColor when shown with Messsage `default` value black
    ///   - backgroundColor: Message container backgroundColor `default` white
    ///   - messageTextColor: Message textColor  `default` black
    ///   - indicatorBackGroundColor: Activity indicator BackGroundColor `default` Gray
    public init(indicatorColor:UIColor = UIColor.white,indicatorColorWithMessage:UIColor = UIColor.black,backgroundColor:UIColor = UIColor.white,messageTextColor:UIColor = UIColor.black,indicatorBackGroundColor:UIColor = UIColor.gray) {
        self.indicatorColor = indicatorColor
        self.indicatorColorWithMessage = indicatorColorWithMessage
        self.messageBackgroundColor = backgroundColor
        self.messageTextColor = messageTextColor
        self.indicatorBackGroundColor = indicatorBackGroundColor
    }
    
    public static let `default`:ActivityConfiguration = ActivityConfiguration()
}
