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
        self.showActivityIndicator(isHidden: false, message: "With great power comes great responsibility")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.hideActivityIndicator()
            self.showActivityIndicator()
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

