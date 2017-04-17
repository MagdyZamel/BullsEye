//
//  ViewController.swift
//  bullsEye
//
//  Created by Magdi Zamel on 4/8/17.
//  Copyright © 2017 Magdi Zamel. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    @IBOutlet weak var hitMe: UIButton!
    
    //
    //    var targetValue :Int!
    //    var currentValue :Int!
    //    var score :Int!
    //    var round :Int!
    //
       var targetValue  = 0
        var currentValue  =  0
       var score  = 0
        var round  = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
        startNewRound()
        updateUI()
    }
    
    func initialization(){
        
        hitMe.setImage(UIImage(named: "Button-Highlighted"), for: .highlighted)
        currentValue = 0
        score = 0
        round = 0
    }
    
    func startNewRound()  {
        currentValue =  currentValue == 0 ? 50 : currentValue
        
        targetValue = 1 + Int(arc4random_uniform(100))
        slider.value = Float(currentValue)
        round = round + 1
    }
    
    @IBAction func press (){
        currentValue = lroundf(slider.value)
        let reportTitle:String
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        
        if (difference == 0) {
            reportTitle = "Perfect!"
            points += 100
        } else if (difference < 5) {
            reportTitle = "You almost had it!"
            points += 50
        } else if (difference < 10) {
            reportTitle = "Pretty good!"
        } else {
            reportTitle = "Not even close..."
        }
        
        score = points + score
        
        let report = UIAlertController(title: reportTitle, message: "You scord \(points) points \nyour value is : \(currentValue )\nyour target is : \(targetValue)", preferredStyle: .alert)
        report.addAction(UIAlertAction(title: "Ok", style: .default, handler: (okPressed)))
        self.present(report, animated: true, completion: nil)
        
    }
    
    func okPressed(action :UIAlertAction)  {
        startNewRound()
        updateUI()

    }
    @IBAction func reset() {
        initialization()
        startNewRound()
        updateUI()
    }
    func updateUI() {
        roundLabel.text! = "\(round)"
        scoreLabel.text! = "\(score)"
        targetLabel.text! = "\(targetValue)"
    }
    @IBAction func sliderMove(_ sender: UISlider) {
        currentValue = lroundf(slider.value)
        print(currentValue)
    }
}






































