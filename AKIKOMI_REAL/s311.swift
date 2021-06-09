//
//  s311.swift
//  AKIKOMI_REAL
//
//  Created by 田中大誓 on 2021/06/08.
//

import UIKit
import MBCircularProgressBar

class s311: UIViewController {
    
    
    @IBOutlet weak var valueSliders311: UISlider!
    @IBOutlet weak var s311Circle: MBCircularProgressBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initCircles311()
    }
    
    
    
    @IBAction func Sliderviews311(_ sender: UISlider) {
        s311Circle.value = CGFloat(sender.value)

    }
        
    
    func initCircles311() {
        valueSliders311.value = 55
        
        s311Circle.maxValue = CGFloat(valueSliders311.maximumValue)
        s311Circle.value = CGFloat(valueSliders311.value)
        
    }

}
