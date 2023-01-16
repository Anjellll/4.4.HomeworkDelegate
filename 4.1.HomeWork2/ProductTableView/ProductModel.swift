//
//  ProductModel.swift
//  4.1.HomeWork2
//
//  Created by anjella on 22/12/22.
//

import UIKit

struct ProductModel: Equatable {
    var id = UUID()
    let productImageIcon: UIImage
    let productName: String
    let openClose: String
    let firstDot: UIImage
    let timeDelivery: String
    let ratingProductIcon: UIImage
    let ratingProduct: String
    let cuisineName: String
    let secondDot: UIImage
    let burgers: String
    let costDelivery1: String
    let thirdDot: UIImage
    let costDelivery2: String
    let distanceIcon: UIImage?
    let dictance: String // }15
    
    static func ==(lhs: ProductModel, rhs: ProductModel) -> Bool {
        lhs.id == rhs.id
    }
}
