//
//  MenuList.swift
//  StarBucksCoffee
//
//  Created by Vikram Kunwar on 22/11/23.
//

import UIKit

class MenuList: UIViewController {
    
    @IBOutlet weak var iceBtn: UIButton!
    
    @IBOutlet weak var hotBtn: UIButton!
    
    @IBOutlet weak var tallBtn: UIButton!
    
    @IBOutlet weak var mediumBtn: UIButton!

    @IBOutlet weak var largeBtn: UIButton!

    @IBOutlet weak var cupImagess: UIImageView!
    
    @IBOutlet weak var coffeePrices: UILabel!
    

    
    var coffeePri = ["$ 6.99","$ 4.26","$ 3.55"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iceBtn.layer.borderColor = UIColor.white.cgColor
        hotBtn.layer.borderColor = UIColor.white.cgColor
        
        iceBtn.layer.borderWidth = 1.5
        hotBtn.layer.borderWidth = 1.5
        
        iceBtn.backgroundColor = UIColor(hex: "#D57B56")
                
                // Set initial background color for hotBtn
                hotBtn.backgroundColor = UIColor.clear
        

        tallBtn.backgroundColor =  UIColor(hex: "#D57B56")
        
        mediumBtn.backgroundColor = UIColor.clear
        
        largeBtn.backgroundColor = UIColor.clear
        
        animateImageChange(imageName: "cupChoco1",priceIndex: 2)
        

    }
    
    @IBAction func iceBtnClicked(_ sender: UIButton){
        
        iceBtn.backgroundColor = UIColor(hex: "#D57B56") // Change background color
                hotBtn.backgroundColor = UIColor.clear
    }
    
    
    @IBAction func hotBtnClicked(_ sender: UIButton){
        hotBtn.backgroundColor = UIColor(hex: "#D57B56") // Change background color
                iceBtn.backgroundColor = UIColor.clear
        
    }
    
    @IBAction func tallBtnClicked(_ sender: UIButton){
        
        tallBtn.backgroundColor =  UIColor(hex: "#D57B56")
        cupImagess.image = UIImage(named: "cupChoco1")
        animateImageChange(imageName: "cupChoco1",priceIndex: 2)
        
        mediumBtn.backgroundColor = UIColor.clear
        
        largeBtn.backgroundColor = UIColor.clear

        
    }
    
    @IBAction func mediumBtnClicked(_ sender: UIButton){
        
        tallBtn.backgroundColor =  UIColor.clear
        
        mediumBtn.backgroundColor = UIColor(hex: "#D57B56")
        animateImageChange(imageName: "cupChoco3",priceIndex: 1)
        cupImagess.image = UIImage(named: "cupChoco 3")

        
        largeBtn.backgroundColor = UIColor.clear

        
        
    }
    
    @IBAction func largeBtnClicked(_ sender: UIButton){
        
        tallBtn.backgroundColor =  UIColor.clear
        cupImagess.image = UIImage(named: "cupChoco 2")
        animateImageChange(imageName: "cupChoco 2",priceIndex: 0)
        

        
        mediumBtn.backgroundColor = UIColor.clear
        
        largeBtn.backgroundColor = UIColor(hex: "#D57B56")

        
        
    }
    
    
    
    func animateImageChange(imageName: String, priceIndex: Int) {
        UIView.transition(with: cupImagess,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: {
                              self.cupImagess.image = UIImage(named: imageName)
                          },
                          completion: nil)
        
        UIView.transition(with: coffeePrices,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: {
                              self.coffeePrices.text = self.coffeePri[priceIndex]
                          },
                          completion: nil)
    }
    
    @IBAction func dismissBack(_ sender:UIButton){
        
        dismiss(animated: true,completion: nil)
    }
    
    
    
    
    
    
    
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}


