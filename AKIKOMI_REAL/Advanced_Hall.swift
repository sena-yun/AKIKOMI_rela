//
//  Advanced_Hall.swift
//  AKIKOMI_REAL
//
//  Created by 田中大誓 on 2021/06/08.
//

import UIKit
import MBCircularProgressBar
import Charts

class Advanced_Hall: UIViewController {

    @IBOutlet weak var barChartViewAdvancedHall: BarChartView!
    @IBOutlet weak var valueSliderAdvancedHall: UISlider!
    @IBOutlet weak var AdvancedHallCircle: MBCircularProgressBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rawData: [Int] = [20, 50, 70, 30, 60, 90, 40, 50, 60, 70, 50, 40]
        let entries = rawData.enumerated().map { BarChartDataEntry(x: Double($0.offset), y: Double($0.element)) }
        let dataSet = BarChartDataSet(entries: entries)
        let data = BarChartData(dataSet: dataSet)
        barChartViewAdvancedHall.data = data
        // barの色
        dataSet.colors = [.systemBlue]
        
        // X軸のラベルの位置を下に設定
        barChartViewAdvancedHall.xAxis.labelPosition = .bottom
        // X軸のラベルの色を設定
        barChartViewAdvancedHall.xAxis.labelTextColor = .systemGray
        // X軸の線、グリッドを非表示にする
        barChartViewAdvancedHall.xAxis.drawGridLinesEnabled = false
        barChartViewAdvancedHall.xAxis.drawAxisLineEnabled = false
        
        // 右側のY座標軸は非表示にする
        barChartViewAdvancedHall.rightAxis.enabled = false
        
        // Y座標の値が0始まりになるように設定
        barChartViewAdvancedHall.leftAxis.axisMinimum = 0.0
        barChartViewAdvancedHall.leftAxis.drawZeroLineEnabled = true
        barChartViewAdvancedHall.leftAxis.zeroLineColor = .systemGray
        // ラベルの数を設定
        barChartViewAdvancedHall.leftAxis.labelCount = 5
        // ラベルの色を設定
        barChartViewAdvancedHall.leftAxis.labelTextColor = .systemGray
        // グリッドの色を設定
        barChartViewAdvancedHall.leftAxis.gridColor = .systemGray
        // 軸線は非表示にする
        barChartViewAdvancedHall.leftAxis.drawAxisLineEnabled = false
        
        barChartViewAdvancedHall.legend.enabled = false
        
        let avg = rawData.reduce(0) { return $0 + $1 } / rawData.count
        let limitLine = ChartLimitLine(limit: Double(avg))
        limitLine.lineColor = .systemOrange
        limitLine.lineDashLengths = [4]
        barChartViewAdvancedHall.leftAxis.addLimitLine(limitLine)
        
        barChartViewAdvancedHall.animate(yAxisDuration: 1)

        // Do any additional setup after loading the view.
        initCircleAdvancedHall()
    }
    
    @IBAction func SliderviewAdvancedHall(_ sender: UISlider) {
        AdvancedHallCircle.value = CGFloat(sender.value)
    }
    
    func initCircleAdvancedHall() {
        valueSliderAdvancedHall.value = 55
        
        AdvancedHallCircle.maxValue = CGFloat(valueSliderAdvancedHall.maximumValue)
        AdvancedHallCircle.value = CGFloat(valueSliderAdvancedHall.value)
    }

}
