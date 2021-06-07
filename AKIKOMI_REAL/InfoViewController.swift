//
//  InfoViewController.swift
//  AKIKOMI_REAL
//
//  Created by 尹セナ on 2021/05/25.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var InfoSegment: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        // Do any additional setup after loading the view.
    }

    @IBAction func InfoSegmentAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            view.backgroundColor = .black
            
        }
        else if sender.selectedSegmentIndex == 1{
            view.backgroundColor = .red
            
        }
        else if sender.selectedSegmentIndex == 2{
            view.backgroundColor = .orange
        }
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
