//
//  Favorite.swift
//  AKIKOMI_REAL
//
//  Created by 田中大誓 on 2021/06/20.
//

import UIKit

class Favorite:  UIViewController ,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    // section毎の画像配列
       let imgArray: NSArray = [
           "advanced hall","s311",
           "s312","sagano_hall1",
           "liburary_south","south_building"
           ]
       
       let label2Array: NSArray = [
           "Advanced Hall","s311",
           "s312","Sagano Hall",
           "Library","South Building"
           ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //Table Viewのセルの数を指定
        func tableView(_ table: UITableView,
                       numberOfRowsInSection section: Int) -> Int {
            return imgArray.count
            
    }
    //各セルの要素を設定する
        func tableView(_ table: UITableView,
                       cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            // tableCell の ID で UITableViewCell のインスタンスを生成
            let cell = table.dequeueReusableCell(withIdentifier: "tableCell",
                                                 for: indexPath)
            
            let img = UIImage(named: imgArray[indexPath.row] as! String)
            
            // Tag番号 1 で UIImageView インスタンスの生成
            let imageView = cell.viewWithTag(1) as! UIImageView
            imageView.image = img
            
            // Tag番号 ２ で UILabel インスタンスの生成
            let label1 = cell.viewWithTag(2) as! UILabel
            label1.text = "No." + String(indexPath.row + 1)
            
            // Tag番号 ３ で UILabel インスタンスの生成
            let label2 = cell.viewWithTag(3) as! UILabel
            label2.text = String(describing: label2Array[indexPath.row])
            
            return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            // セルの選択を解除
            // 遷移前にセルの選択状態を解除しておかないと、Appleの審査に落ちることがあるらしい
            tableView.deselectRow(at: indexPath, animated: true)
            
            // performSegue(withIdentifier: "toTestView", sender: nil)

            // 別の画面に遷移
            switch indexPath.row {
            case 0:
                performSegue(withIdentifier: "toAdvancedHall", sender: nil)
            case 1:
                performSegue(withIdentifier: "tos311", sender: nil)
            case 2:
                performSegue(withIdentifier: "tos312", sender: nil)
            case 3:
                performSegue(withIdentifier: "toSaganoHall", sender: nil)
            case 4:
                performSegue(withIdentifier: "toLibrary", sender: nil)
            case 5:
                performSegue(withIdentifier: "toSouthBuilding", sender: nil)
            default:
                break
            }
        }
}
