//
//  s312.swift
//  AKIKOMI_REAL
//
//  Created by 田中大誓 on 2021/06/08.
//

import UIKit
import MBCircularProgressBar
import Charts

class s312: UIViewController {
    
    @IBOutlet weak var barChartViews312: BarChartView!
    @IBOutlet weak var valueSliders312: UISlider!
    @IBOutlet weak var s312Circle: MBCircularProgressBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rawData: [Int] = [20, 50, 70, 30, 60, 90, 40, 50, 60, 70, 50, 40]
        let entries = rawData.enumerated().map { BarChartDataEntry(x: Double($0.offset), y: Double($0.element)) }
        let dataSet = BarChartDataSet(entries: entries)
        let data = BarChartData(dataSet: dataSet)
        barChartViews312.data = data
        // barの色
        dataSet.colors = [.systemBlue]
        
        // X軸のラベルの位置を下に設定
        barChartViews312.xAxis.labelPosition = .bottom
        // X軸のラベルの色を設定
        barChartViews312.xAxis.labelTextColor = .systemGray
        // X軸の線、グリッドを非表示にする
        barChartViews312.xAxis.drawGridLinesEnabled = false
        barChartViews312.xAxis.drawAxisLineEnabled = false
        
        // 右側のY座標軸は非表示にする
        barChartViews312.rightAxis.enabled = false
        
        // Y座標の値が0始まりになるように設定
        barChartViews312.leftAxis.axisMinimum = 0.0
        barChartViews312.leftAxis.drawZeroLineEnabled = true
        barChartViews312.leftAxis.zeroLineColor = .systemGray
        // ラベルの数を設定
        barChartViews312.leftAxis.labelCount = 5
        // ラベルの色を設定
        barChartViews312.leftAxis.labelTextColor = .systemGray
        // グリッドの色を設定
        barChartViews312.leftAxis.gridColor = .systemGray
        // 軸線は非表示にする
        barChartViews312.leftAxis.drawAxisLineEnabled = false
        
        barChartViews312.legend.enabled = false
        
        let avg = rawData.reduce(0) { return $0 + $1 } / rawData.count
        let limitLine = ChartLimitLine(limit: Double(avg))
        limitLine.lineColor = .systemOrange
        limitLine.lineDashLengths = [4]
        barChartViews312.leftAxis.addLimitLine(limitLine)
        
        barChartViews312.animate(yAxisDuration: 1)

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
