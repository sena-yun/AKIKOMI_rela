//
//  s312.swift
//  AKIKOMI_REAL
//
//  Created by 田中大誓 on 2021/06/08.
//

import UIKit
import MBCircularProgressBar

class s312: UIViewController {
    
    @IBOutlet weak var valueSliders312: UISlider!
    @IBOutlet weak var s312Circle: MBCircularProgressBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initCircles312()
    }
    

    @IBAction func Sliderview(_ sender: UISlider) {
        
        s312Circle.value = CGFloat(sender.value)

    }
    
    func initCircles312() {
        
        valueSliders312.value = 55
        
        s312Circle.maxValue = CGFloat(valueSliders312.maximumValue)
        s312Circle.value = CGFloat(valueSliders312.value)
    }
  
}
