//
//  ViewController.swift
//  bullsEye
//
//  Created by Magdi Zamel on 4/8/17.
//  Copyright © 2017 Magdi Zamel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var currentValue: UILabel!
    
    var targetValue = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       currentValue.text = "\(Int(slider.value))"
        startNewRound()
    }

    
    func startNewRound()  {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue.text = "\(Float(targetValue))"
        slider.value = Float(targetValue)
    }
    
    @IBAction func press (){
        self.startNewRound()
    let alert = UIAlertController(title: "test", message: "the value of the silder is : \(Int(slider.value)) \nThe target value is : \(targetValue )", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "test", style: .default, handler: { (UIAlertAction) in self.startNewRound()}))
        
    self.present(alert, animated: false, completion: nil)
        
    }

    @IBAction func sliderMove(_ sender: UISlider) {
        currentValue.text = "\(Int(slider.value))"

        
    }
}






































