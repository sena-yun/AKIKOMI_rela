//
//  Advanced_Hall.swift
//  AKIKOMI_REAL
//
//  Created by 田中大誓 on 2021/06/08.
//

import UIKit
import MBCircularProgressBar

class Advanced_Hall: UIViewController {

    @IBOutlet weak var valueSliderAdvancedHall: UISlider!
    @IBOutlet weak var AdvancedHallCircle: MBCircularProgressBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initCircleAdvancedHall()
    }
    
    @IBAction func SliderviewAdvancedHall(_ sender: UISlider) {
        AdvancedHallCircle.value = CGFloat(sender.value)
    }
    
    func initCircleAdvancedHall() {
        valueSliderAdvancedHall.value = 55
        
        AdvancedHallCircle.maxValue = CGFloat(valueSliderAdvancedHall.maximumValue)
        AdvancedHallCircle.value = CGFloat(valueSliderAdvancedHall.value)
    }

}
