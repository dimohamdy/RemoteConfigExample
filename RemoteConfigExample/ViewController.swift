//
//  ViewController.swift
//  RemoteConfigExample
//
//  Created by BinaryBoy on 1/15/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.isHidden = LoginConfigManager.shared.config?.showLabel ?? false
        button.isHidden = LoginConfigManager.shared.config?.showButton ?? false

    }
}

