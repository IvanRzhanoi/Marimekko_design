//
//  UploadViewController.swift
//  MarimekkoDesigApp
//
//  Created by Ivan Rzhanoi on 17/09/2017.
//  Copyright © 2017 Ivan Rzhanoi. All rights reserved.
//

import UIKit

class UploadViewController: UIViewController {

    @IBOutlet weak var file: UIButton!
    @IBOutlet weak var send: UIButton!
    @IBOutlet weak var design: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        file.layer.borderWidth = 1
        file.layer.borderColor = UIColor.black.cgColor
        
        send.layer.borderWidth = 1
        send.layer.borderColor = UIColor.black.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func fileCreation(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.design.alpha = 1.0
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
