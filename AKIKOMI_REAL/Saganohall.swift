//
//  Saganohall.swift
//  AKIKOMI_REAL
//
//  Created by 田中大誓 on 2021/06/08.
//

import UIKit
import MBCircularProgressBar

class Saganohall: UIViewController {

    @IBOutlet weak var valueSliderSaganoHall: UISlider!
    @IBOutlet weak var SaganoHallCircle: MBCircularProgressBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initCircleSaganoHall()
    }
    
    @IBAction func SliderviewSaganoHall(_ sender: UISlider) {
        SaganoHallCircle.value = CGFloat(sender.value)
    }
    
    func initCircleSaganoHall() {
        valueSliderSaganoHall.value = 55
        
        SaganoHallCircle.maxValue = CGFloat(valueSliderSaganoHall.maximumValue)
        SaganoHallCircle.value = CGFloat(valueSliderSaganoHall.value)
    }
    

}
