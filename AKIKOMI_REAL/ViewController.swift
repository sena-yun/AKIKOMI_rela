//
//  ViewController.swift
//  AKIKOMI_REAL
//
//  Created by 尹セナ on 2021/04/30.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var barChartView: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rawData: [Int] = [20, 50, 70, 30, 60, 90, 40, 50, 60, 70, 50, 40]
        let entries = rawData.enumerated().map { BarChartDataEntry(x: Double($0.offset), y: Double($0.element)) }
        let dataSet = BarChartDataSet(entries: entries)
        let data = BarChartData(dataSet: dataSet)
        barChartView.data = data
        // barの色
        dataSet.colors = [.systemBlue]
        
        // X軸のラベルの位置を下に設定
        barChartView.xAxis.labelPosition = .bottom
        // X軸のラベルの色を設定
        barChartView.xAxis.labelTextColor = .systemGray
        // X軸の線、グリッドを非表示にする
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.xAxis.drawAxisLineEnabled = false
        
        // 右側のY座標軸は非表示にする
        barChartView.rightAxis.enabled = false
        
        // Y座標の値が0始まりになるように設定
        barChartView.leftAxis.axisMinimum = 0.0
        barChartView.leftAxis.drawZeroLineEnabled = true
        barChartView.leftAxis.zeroLineColor = .systemGray
        // ラベルの数を設定
        barChartView.leftAxis.labelCount = 5
        // ラベルの色を設定
        barChartView.leftAxis.labelTextColor = .systemGray
        // グリッドの色を設定
        barChartView.leftAxis.gridColor = .systemGray
        // 軸線は非表示にする
        barChartView.leftAxis.drawAxisLineEnabled = false
        
        barChartView.legend.enabled = false
        
        let avg = rawData.reduce(0) { return $0 + $1 } / rawData.count
        let limitLine = ChartLimitLine(limit: Double(avg))
        limitLine.lineColor = .systemOrange
        limitLine.lineDashLengths = [4]
        barChartView.leftAxis.addLimitLine(limitLine)
        
        barChartView.animate(yAxisDuration: 1)
        
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

