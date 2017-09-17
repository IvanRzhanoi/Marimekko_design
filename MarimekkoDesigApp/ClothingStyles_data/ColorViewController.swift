//
//  ColorViewController.swift
//  MarimekkoDesigApp
//
//  Created by Ivan Rzhanoi on 16/09/2017.
//  Copyright © 2017 Ivan Rzhanoi. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    
    @IBOutlet weak var myImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        whiteButton.backgroundColor = .clear
//        whiteButton.layer.cornerRadius = 6
//        whiteButton.layer.borderWidth = 1
//        whiteButton.layer.borderColor = UIColor.black.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateImage(image: UIImage) {
        UIView.transition(with: myImageView,
                          duration: 0.25,
                          options: .transitionCrossDissolve,
                          animations: { self.myImageView.image = image },
                          completion: nil)
    }

    @IBAction func button1(_ sender: Any) {
        updateImage(image: #imageLiteral(resourceName: "image11.png"))
    }
    
    @IBAction func button2(_ sender: Any) {
        updateImage(image: #imageLiteral(resourceName: "image11c.png"))
    }
    
    @IBAction func button3(_ sender: Any) {
        updateImage(image: #imageLiteral(resourceName: "image11b.png"))
    }
    
    @IBAction func button4(_ sender: Any) {
        updateImage(image: #imageLiteral(resourceName: "image11a.png"))
    }
}
