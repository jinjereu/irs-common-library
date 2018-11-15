//
//  ViewController.swift
//  IRSCommonLibrary
//
//  Created by jinjereu on 11/15/2018.
//  Copyright (c) 2018 jinjereu. All rights reserved.
//

import UIKit
import IRSCommonLibrary


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		
		IRSTestUtil.test()
		
		let red: UIColor = .red
		let _ = red.brighten(0.5)
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

