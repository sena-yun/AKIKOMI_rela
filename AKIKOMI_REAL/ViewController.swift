//
//  ViewController.swift
//  AKIKOMI_REAL
//
//  Created by 尹セナ on 2021/04/30.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func URLcm1(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"https://www.kuas.ac.jp/opencampus")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func URLcm2(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"https://www.kuas.ac.jp/opencampus/2021/202105-web#online")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func URLcm3(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"https://www.kuas.ac.jp/interview/")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func URLcm4(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"https://www.kuas.ac.jp/opencampus/2021/webopencampus")! as URL, options: [:], completionHandler: nil)
    }
}

