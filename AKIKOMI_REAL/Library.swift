//
//  Library.swift
//  AKIKOMI_REAL
//
//  Created by 田中大誓 on 2021/06/08.
//

import UIKit
import MBCircularProgressBar

class Library: UIViewController {

    @IBOutlet var Library_Circle: MBCircularProgressBarView!
    
    @IBOutlet weak var valueSlider: UISlider!
    @IBOutlet weak var libraryCircle: MBCircularProgressBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initCircleLibrary()
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func Sliderview(_ sender: UISlider) {
        
        label.text = String(sender.value)
        libraryCircle.value = CGFloat(sender.value)
        
    }
    
    func initCircleLibrary() {
        // init value
        valueSlider.value = 55
        
        libraryCircle.maxValue = CGFloat(valueSlider.maximumValue)
        libraryCircle.value = CGFloat(valueSlider.value)
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
