//
//  ViewController.swift
//  PrivacyHelper
//
//  Created by zys-developer on 08/18/2021.
//  Copyright (c) 2021 zys-developer. All rights reserved.
//

import UIKit
import PrivacyHelper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PrivacyHelper.photoLibrary {
            print("允许访问")
        } unauthorized: {
            print("拒绝访问")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

