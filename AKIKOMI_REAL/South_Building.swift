//
//  South_Building.swift
//  AKIKOMI_REAL
//
//  Created by 田中大誓 on 2021/06/08.
//

import UIKit
import MBCircularProgressBar

class South_Building: UIViewController {
    
    @IBOutlet weak var valueSliderSouthBuilding: UISlider!
    @IBOutlet weak var SouthBuildingCircle: MBCircularProgressBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initCircleSouthBuilding()
    }

    @IBAction func SouthBuildingSliderview(_ sender: UISlider) {
        
        SouthBuildingCircle.value = CGFloat(sender.value)
    }
    
    func initCircleSouthBuilding() {
        
        valueSliderSouthBuilding.value = 55
        
        SouthBuildingCircle.maxValue = CGFloat(valueSliderSouthBuilding.maximumValue)
        SouthBuildingCircle.value = CGFloat(valueSliderSouthBuilding.value)
    }
}
