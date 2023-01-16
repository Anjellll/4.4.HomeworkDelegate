//
//  AppViewController.swift
//  4.1.HomeWork2
//
//  Created by anjella on 21/12/22.
//

import UIKit

class AppViewController: UIViewController {

    @IBOutlet private weak var firstCollectionView: UICollectionView!
    @IBOutlet private weak var secondCollectionView: UICollectionView!
    @IBOutlet private weak var productTableView: UITableView!
    
    private let mockData: [CustomModel] = [
        .init(imageIconView: UIImage(systemName: "play")!, dataVertically: "Delivery", isSelected: true),
        .init(imageIconView: UIImage(systemName: "play")!, dataVertically: "Pickup", isSelected: true),
        .init(imageIconView: UIImage(systemName: "play")!, dataVertically: "Catering", isSelected: true),
        .init(imageIconView: UIImage(systemName: "play")!, dataVertically: "Curbside", isSelected: true)
        ]
    
    private let secondDataArray: [CollectionModel2] = [
        .init(imageIcon: UIImage(named: "product1")!, productName: "Takeaways"),
        .init(imageIcon: UIImage(named: "product2")!, productName: "Grocery"),
        .init(imageIcon: UIImage(named: "product3")!, productName: "Convenience"),
        .init(imageIcon: UIImage(named: "product4")!, productName: "Pharmacy"),
        .init(imageIcon: UIImage(named: "product4")!, productName: "Pharmacy")
    ]
    
    private let productsArray: [ProductModel] = [
        .init(productImageIcon: UIImage(named: "image1")!, productName: "Burger Craze",
              openClose: "OPEN", firstDot: UIImage(named: "image2")!,
              timeDelivery: "15 -20 min", ratingProductIcon: UIImage(named: "image3")!,
              ratingProduct: "4.6 (601)", cuisineName: "American",
              secondDot: UIImage(named: "image4")!, burgers: "Burgers",
              costDelivery1: "Delivery: FREE", thirdDot: UIImage(named: "image5")!,
              costDelivery2: "Minimum: $10", distanceIcon: UIImage(named: "distance")!,
              dictance: "1.5 km away"),
        .init(productImageIcon: UIImage(named: "image1.2")!, productName: "Vegetarian Pizza",
              openClose: "OPEN", firstDot: UIImage(named: "image2")!,
              timeDelivery: "10 -15 min", ratingProductIcon: UIImage(named: "image3")!,
              ratingProduct: "4.6 (601)", cuisineName: "Italian",
              secondDot: UIImage(named: "image4")!, burgers: "Burgers",
              costDelivery1: "Delivery: FREE", thirdDot: UIImage(named: "image5")!,
              costDelivery2: "Minimum: $10",distanceIcon: UIImage(named: "distance")!,
              dictance: "")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
//        let layout = UICollectionViewFlowLayout()
//        firstCollectionView.collectionViewLayout = layout
//        secondCollectionView.collectionViewLayout = layout
        configureCollectionView()
        configureTableView()
    }
    
    private func configureCollectionView() {
        firstCollectionView.dataSource = self
        firstCollectionView.delegate = self
        firstCollectionView.register(
            UINib(
                nibName: String(describing: CustomCollectionViewCell.self),
                bundle: nil), forCellWithReuseIdentifier: CustomCollectionViewCell.reuseID)
        
        secondCollectionView.dataSource = self
        secondCollectionView.delegate = self
        secondCollectionView.register(
            UINib(
                nibName: String(describing: SecondCollectionViewCell.self),
                bundle: nil), forCellWithReuseIdentifier: SecondCollectionViewCell.reuseID2)
    }
    
    private func configureTableView() {
        productTableView.dataSource = self
        productTableView.delegate = self
        productTableView.register(UINib(
                nibName: String(describing: ProductTableViewCell.self),
                bundle: nil),
                forCellReuseIdentifier: ProductTableViewCell.reuseID3)
    }
}

extension AppViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        if collectionView == firstCollectionView {
            return mockData.count
        }else{
            return secondDataArray.count
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        if collectionView == firstCollectionView {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "CustomCollectionViewCell",
                for: indexPath) as! CustomCollectionViewCell
            let data = mockData[indexPath.row]
            cell.display(item: data)
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "SecondCollectionViewCell",
                for: indexPath) as! SecondCollectionViewCell
            let data = secondDataArray[indexPath.row]
            cell.display2(item: data)
            return cell
        }
    }
}

extension AppViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
          layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        if collectionView == firstCollectionView {
            return CGSize(width: 100, height: 128)
        } else {
            return CGSize(width: 100, height: 130)
        }
    }
}

extension AppViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.reuseID3, for: indexPath) as! ProductTableViewCell
        as! ProductTableViewCell
        cell.delegate = self
        cell.imageDelegate = self
//        cell.deliveryTapped = { [weak self] product in
//            guard let `self` = self else { return }
//            self.selectedProduct(item: product)
//        }
        
        let data = productsArray[indexPath.row]
        cell.display3(item: data)
        return cell
    }
    
    private func selectedProduct(item: ProductModel) {
        print(item.productName)
    }
}

extension AppViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath)
    -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AppViewController: ProductCellDelegate {
    func selectProduct(_ item: ProductModel) {
        print(item.productName)
    }
    

}

extension AppViewController: ImageDelegate {
    func addToImageViewController(_ item: ProductModel) {
        let imageVC = storyboard?.instantiateViewController(withIdentifier: "ImageVC") as! ImageVC
        imageVC.image = item.productImageIcon
        navigationController?.pushViewController(imageVC, animated: true)
    }
}
