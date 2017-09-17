//
//  Data.swift
//  MarimekkoDesigApp
//
//  Created by Ivan Rzhanoi on 16/09/2017.
//  Copyright © 2017 Ivan Rzhanoi. All rights reserved.
//

import UIKit

class Data {
    
    var clothingStyle: UIImage?
    
    init?(clothingStyle: UIImage?) {
        
        // Initialization should fail if there is no name or if the rating is negative.
//        if clothingStyle_left.isEmpty || clothingStyle_right.isEmpty  {
//            return nil
//        }
        
        self.clothingStyle = clothingStyle
    }
}

    

