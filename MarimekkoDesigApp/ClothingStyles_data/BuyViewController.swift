//
//  BuyViewController.swift
//  MarimekkoDesigApp
//
//  Created by Ivan Rzhanoi on 17/09/2017.
//  Copyright © 2017 Ivan Rzhanoi. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController {


    @IBOutlet weak var buyButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buyButton.layer.borderWidth = 1
        buyButton.layer.borderColor = UIColor.black.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buy(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
