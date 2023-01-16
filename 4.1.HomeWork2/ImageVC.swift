//
//  ImageVC.swift
//  4.1.HomeWork2
//
//  Created by anjella on 29/12/22.
//

import UIKit

class ImageVC: UIViewController {
    
    @IBOutlet weak var productImage: UIImageView!
    var image = UIImage()
    
    override func viewDidLoad() {
        productImage.image = image
    }
    
}


//struct ImageModel {
//    var image = UIImage()
//}
