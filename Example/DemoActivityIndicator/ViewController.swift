//
//  ViewController.swift
//  DemoActivityIndicator
//
//  Created by mihirpmehta on 01/23/2019.
//  Copyright (c) 2019 mihirpmehta. All rights reserved.
//

import UIKit
import DemoActivityIndicator

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration:ActivityConfiguration = ActivityConfiguration(indicatorColor: UIColor.blue, indicatorColorWithMessage: UIColor.red, backgroundColor: UIColor.green, messageTextColor: UIColor.yellow, indicatorBackGroundColor: UIColor.brown)
        self.showActivityIndicator(isHidden: false, message: "With great power comes great responsibility",configuration: configuration)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.hideActivityIndicator()
            self.showActivityIndicator(configuration: configuration)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.hideActivityIndicator()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

