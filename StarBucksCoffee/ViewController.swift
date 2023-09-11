//
//  ViewController.swift
//  StarBucksCoffee
//
//  Created by Vikram Kunwar on 31/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var starsBucksCollection: UICollectionView!
    
    var coffeeName = ["Choco Coffee","Green Coffee","Black Coffee","Pink Coffee"]
    
    var coffeeImages = ["bgChoco","bgGreen","bgChoco","bgGreen"]
    
    var coffeecup = ["cupChoco","cupGreen","cupGreen2","cupPink"]
    
    @IBOutlet weak var logo: UIImageView!
    
    
    
    
    @IBOutlet weak var buyNowBtn: UIButton!
    
    var isLogoCentered = false
        
        // Store the original frame of the logo
        var originalLogoFrame: CGRect!

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buyNowBtn.layer.cornerRadius = 15
        buyNowBtn.clipsToBounds = true
        
        originalLogoFrame = logo.frame
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleLogoTap))
                logo.addGestureRecognizer(tapGesture)
                logo.isUserInteractionEnabled = true //
        
        
        
    }
    
    // Handle the tap on the logo
        @objc func handleLogoTap() {
            if isLogoCentered {
                // Logo is centered, move it back to its original position
                UIView.animate(withDuration: 0.5) {
                    self.logo.frame = self.originalLogoFrame
                    // Show the hidden elements (if you've hidden them)
                     self.starsBucksCollection.isHidden = false
                     self.buyNowBtn.isHidden = false
                }
            } else {
                // Logo is not centered, move it to the center of the screen
                UIView.animate(withDuration: 0.5) {
                    let centerX = self.view.frame.midX - self.logo.frame.width / 2
                    let centerY = self.view.frame.midY - self.logo.frame.height / 2
                    self.logo.frame = CGRect(x: centerX, y: centerY, width: self.logo.frame.width, height: self.logo.frame.height)
                    // Hide the elements you want to disappear
                     self.starsBucksCollection.isHidden = true
                     self.buyNowBtn.isHidden = true
                }
            }
            
            isLogoCentered.toggle()
                }
    
    
    
    @IBAction func AddtoCart(_ sender: UIButton) {
        let alert = UIAlertController(title: "Add to Cart?", message: "Do you want to add to Cart?", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
                    // Handle "Yes"
                }))
                
                alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { _ in
                    // Handle "No"
                }))
                
                present(alert, animated: true, completion: nil)
            }
    
    
   
    

}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coffeeName.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = starsBucksCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StarBucksCVC
        
        cell.coffeeLbl.text = coffeeName[indexPath.row]
        cell.coffeeImg.image = UIImage(named: coffeeImages[indexPath.row])
        cell.coffeeView.layer.cornerRadius = 20
        cell.coffeeCupImg.image = UIImage(named: coffeecup[indexPath.row])
        cell.priceBtn.layer.cornerRadius = 20
        
        cell.startAnimation()
        
        cell.priceBtn.clipsToBounds = true
        cell.coffeeView.clipsToBounds = true
        return cell
    }
    
    
        
    
    func applyParallaxAnd3DZoomEffect(to cell: StarBucksCVC, xOffset: CGFloat) {
            let parallaxOffset = xOffset * 150  // Adjust the parallax factor as needed
            
            // Calculate zoom scale based on the parallaxOffset
        let zoomScale = 1.0 - abs(parallaxOffset) / 400.0
            
            // Apply the parallax effect using CGAffineTransform
            cell.transform = CGAffineTransform(translationX: parallaxOffset, y: 0)
            
        
            // Apply 3D-like zoom effect
            let rotation = CATransform3DMakeRotation(-parallaxOffset / 1000.0, 0, 1, 0)
        let scale = CATransform3DMakeScale(zoomScale, zoomScale, 0.0)
            cell.layer.transform = CATransform3DConcat(rotation, scale)
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            for case let cell as StarBucksCVC in starsBucksCollection.visibleCells {
                
                let xOffset = (cell.center.x - starsBucksCollection.contentOffset.x - starsBucksCollection.bounds.width / 2) / starsBucksCollection.bounds.width
                applyParallaxAnd3DZoomEffect(to: cell, xOffset: xOffset)
                cell.startAnimation()
            }
        }
    
    
    
}

