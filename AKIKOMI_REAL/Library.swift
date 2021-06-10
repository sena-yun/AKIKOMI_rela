//
//  Library.swift
//  AKIKOMI_REAL
//
//  Created by 田中大誓 on 2021/06/08.
//

import UIKit
import MBCircularProgressBar

class Library: UIViewController {
    
    @IBOutlet weak var valueSliderLibrary: UISlider!
    @IBOutlet weak var libraryCircle: MBCircularProgressBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initCircleLibrary()
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func SliderviewLibrary(_ sender: UISlider) {
        
        label.text = String(sender.value)
        libraryCircle.value = CGFloat(sender.value)
        
    }
    
    func initCircleLibrary() {
        // init value
        valueSliderLibrary.value = 55
        
        libraryCircle.maxValue = CGFloat(valueSliderLibrary.maximumValue)
        libraryCircle.value = CGFloat(valueSliderLibrary.value)
    
    }

}
