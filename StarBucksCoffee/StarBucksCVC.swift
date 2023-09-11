//
//  StarBucksCVC.swift
//  StarBucksCoffee
//
//  Created by Vikram Kunwar on 31/08/23.
//

import UIKit

class StarBucksCVC: UICollectionViewCell {
    
    @IBOutlet weak var coffeeLbl: UILabel!
    
    @IBOutlet weak var coffeeImg: UIImageView!
    
    @IBOutlet weak var coffeeView: UIView!
    
    @IBOutlet weak var coffeeCupImg: UIImageView!
    
    @IBOutlet weak var priceBtn: UIButton!
    
    @IBOutlet weak var descrip: UITextView!
    
    private var isAnimating = true
        private var scrollTimer: Timer?
    
    
    override func awakeFromNib() {
            super.awakeFromNib()
        startAnimation()

            // Set initial alpha value for coffeeImg
            coffeeImg.alpha = 0.7
            
            
        }

    
    override func layoutSubviews() {
          super.layoutSubviews()
        startAnimation()
        

          if isAnimating {
              // Set initial transform for offscreen animation
              coffeeCupImg.transform = CGAffineTransform(translationX: 0, y: -coffeeCupImg.frame.height)

              // Animate coffeeCupImg into view with spring effect and limit to 1 bounce
              UIView.animate(withDuration: 5.0, delay: 0, usingSpringWithDamping: 3.0, initialSpringVelocity: 3.0, options: []) {
                  self.coffeeCupImg.transform = .identity
              } completion: { _ in
                  // Animation completed, set isAnimating to false
//                  self.isAnimating = false
                  UIView.animate(withDuration: 0.5, animations: {
                              self.priceBtn.transform = CGAffineTransform(rotationAngle: .pi)
                          }) { (finished) in
                              UIView.animate(withDuration: 0.5, animations: {
                                  self.priceBtn.transform = CGAffineTransform.identity
                              })
                          }

                  
                  // Set a timer to stop the animation after 2 seconds
                  self.scrollTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
//                      self.stopAnimation()
                  }
              }

              // Animate coffeeLbl with Hero-like animation
              UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut]) {
                  self.coffeeLbl.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
              } completion: { _ in
                  // Animation completed
              }
              
              
          }
        
      }
    
    override func prepareForReuse() {
            super.prepareForReuse()
            // Reset isAnimating when cell is reused
             isAnimating = true
//                stopAnimation()
                scrollTimer?.invalidate()
                scrollTimer = nil
        }
    
    
    func startAnimation() {
        UIView.animate(withDuration: 0.6,
                           delay: 0,
                           options: [.curveEaseOut, .autoreverse, .repeat],
                           animations: {
                self.coffeeLbl.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }, completion: nil)
        }
        
        func stopAnimation() {
            coffeeLbl.layer.removeAllAnimations()
            coffeeLbl.transform = .identity
        }
//

    
    
    
    
    
    
}
