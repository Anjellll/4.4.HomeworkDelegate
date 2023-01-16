//
//  CustomCollectionViewCell.swift
//  4.1.HomeWork2
//
//  Created by anjella on 21/12/22.
//

import UIKit


class CustomCollectionViewCell: UICollectionViewCell {
    public static let reuseID = String(describing: CustomCollectionViewCell.self)
    
    @IBOutlet private weak var deliveryImage: UIImageView!
    @IBOutlet private weak var dataVerticallyLabel: UILabel!
    
//    private var selectedItem: CustomModel
    
    func display(item: CustomModel) {
//        selectedItem = selected
        
//        if selected.dataVertically == item.dataVertically {
////            dataVerticallyLabel.backgroundColor = .yellow
//        }
        
        let isSelected = item.isSelected
//        dataVerticallyLabel.textColor = isSelected ? UIColor.white : UIColor.green
        
        deliveryImage.image = item.imageIconView
        dataVerticallyLabel.text = item.dataVertically
    }
    
    @IBInspectable
    private var cornerRadius: CGFloat {
        get { self.layer.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }

    @IBInspectable
    private var contentColor: UIColor {
        get { self.backgroundColor ?? .clear }
        set { self.backgroundColor = newValue }
    }

    // здесь мы даем размеры
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        commonInit()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        commonInit()
//    }
//    private func commonInit() {
//        Bundle.main.loadNibNamed(String(describing: CustomCollectionViewCell.self), owner: self)
//        addSubview(deliveryImage)
//        addSubview(dataVerticallyLabel)
//
//        deliveryImage.frame = bounds
//        deliveryImage.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        dataVerticallyLabel.frame = bounds
//        dataVerticallyLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//    }
}
