//
//  SecondCollectionViewCell.swift
//  4.1.HomeWork2
//
//  Created by anjella on 21/12/22.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
    public static let reuseID2 = String(describing: SecondCollectionViewCell.self)
    
    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var productNameLabel: UILabel!
    
    func display2(item: CollectionModel2) {
        productImageView.image = item.imageIcon
        productNameLabel.text = item.productName
    }
}
