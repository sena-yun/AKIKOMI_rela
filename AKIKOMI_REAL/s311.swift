//
//  s311.swift
//  AKIKOMI_REAL
//
//  Created by 田中大誓 on 2021/06/08.
//

import UIKit
import MBCircularProgressBar
import Charts

class s311: UIViewController {
    
    
    @IBOutlet weak var barChartViews311: BarChartView!
    @IBOutlet weak var valueSliders311: UISlider!
    @IBOutlet weak var s311Circle: MBCircularProgressBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rawData: [Int] = [20, 50, 70, 30, 60, 90, 40, 50, 60, 70, 50, 40]
        let entries = rawData.enumerated().map { BarChartDataEntry(x: Double($0.offset), y: Double($0.element)) }
        let dataSet = BarChartDataSet(entries: entries)
        let data = BarChartData(dataSet: dataSet)
        barChartViews311.data = data
        // barの色
        dataSet.colors = [.systemBlue]
        
        // X軸のラベルの位置を下に設定
        barChartViews311.xAxis.labelPosition = .bottom
        // X軸のラベルの色を設定
        barChartViews311.xAxis.labelTextColor = .systemGray
        // X軸の線、グリッドを非表示にする
        barChartViews311.xAxis.drawGridLinesEnabled = false
        barChartViews311.xAxis.drawAxisLineEnabled = false
        
        // 右側のY座標軸は非表示にする
        barChartViews311.rightAxis.enabled = false
        
        // Y座標の値が0始まりになるように設定
        barChartViews311.leftAxis.axisMinimum = 0.0
        barChartViews311.leftAxis.drawZeroLineEnabled = true
        barChartViews311.leftAxis.zeroLineColor = .systemGray
        // ラベルの数を設定
        barChartViews311.leftAxis.labelCount = 5
        // ラベルの色を設定
        barChartViews311.leftAxis.labelTextColor = .systemGray
        // グリッドの色を設定
        barChartViews311.leftAxis.gridColor = .systemGray
        // 軸線は非表示にする
        barChartViews311.leftAxis.drawAxisLineEnabled = false
        
        barChartViews311.legend.enabled = false
        
        let avg = rawData.reduce(0) { return $0 + $1 } / rawData.count
        let limitLine = ChartLimitLine(limit: Double(avg))
        limitLine.lineColor = .systemOrange
        limitLine.lineDashLengths = [4]
        barChartViews311.leftAxis.addLimitLine(limitLine)
        
        barChartViews311.animate(yAxisDuration: 1)

        // Do any additional setup after loading the view.
        initCircles311()
    }
    
    
    
    @IBAction func Sliderviews311(_ sender: UISlider) {
        s311Circle.value = CGFloat(sender.value)

    }
        
    
    func initCircles311() {
        valueSliders311.value = 55
        
        s311Circle.maxValue = CGFloat(valueSliders311.maximumValue)
        s311Circle.value = CGFloat(valueSliders311.value)
        
    }

}
