//
//  Library.swift
//  AKIKOMI_REAL
//
//  Created by 田中大誓 on 2021/06/08.
//

import UIKit
import MBCircularProgressBar
import Charts

class Library: UIViewController {
    
    @IBOutlet weak var barChartViewLibrary: BarChartView!
    @IBOutlet weak var valueSliderLibrary: UISlider!
    @IBOutlet weak var libraryCircle: MBCircularProgressBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
        barChartLibrary()
        initCircleLibrary()
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func SliderviewLibrary(_ sender: UISlider) {
        libraryCircle.value = CGFloat(sender.value)
        
    }
    
    func initCircleLibrary() {
        // init value
        valueSliderLibrary.value = 55
        
        libraryCircle.maxValue = CGFloat(valueSliderLibrary.maximumValue)
        libraryCircle.value = CGFloat(valueSliderLibrary.value)
    
    }
    
    private func barChartLibrary() {
        
        let rawData: [Int] = [20, 50, 70, 30, 60, 90, 40, 50, 60, 70, 50, 40]
        let entries = rawData.enumerated().map { BarChartDataEntry(x: Double($0.offset), y: Double($0.element)) }
        let dataSet = BarChartDataSet(entries: entries)
        let data = BarChartData(dataSet: dataSet)
        barChartViewLibrary.data = data
        // barの色
        dataSet.colors = [.systemBlue]
        
        // X軸のラベルの位置を下に設定
        barChartViewLibrary.xAxis.labelPosition = .bottom
        // X軸のラベルの色を設定
        barChartViewLibrary.xAxis.labelTextColor = .systemGray
        // X軸の線、グリッドを非表示にする
        barChartViewLibrary.xAxis.drawGridLinesEnabled = false
        barChartViewLibrary.xAxis.drawAxisLineEnabled = false
        
        // 右側のY座標軸は非表示にする
        barChartViewLibrary.rightAxis.enabled = false
        
        // Y座標の値が0始まりになるように設定
        barChartViewLibrary.leftAxis.axisMinimum = 0.0
        barChartViewLibrary.leftAxis.drawZeroLineEnabled = true
        barChartViewLibrary.leftAxis.zeroLineColor = .systemGray
        // ラベルの数を設定
        barChartViewLibrary.leftAxis.labelCount = 5
        // ラベルの色を設定
        barChartViewLibrary.leftAxis.labelTextColor = .systemGray
        // グリッドの色を設定
        barChartViewLibrary.leftAxis.gridColor = .systemGray
        // 軸線は非表示にする
        barChartViewLibrary.leftAxis.drawAxisLineEnabled = false
        
        barChartViewLibrary.legend.enabled = false
        
        let avg = rawData.reduce(0) { return $0 + $1 } / rawData.count
        let limitLine = ChartLimitLine(limit: Double(avg))
        limitLine.lineColor = .systemOrange
        limitLine.lineDashLengths = [4]
        barChartViewLibrary.leftAxis.addLimitLine(limitLine)
        
        barChartViewLibrary.animate(yAxisDuration: 1)
        
        
    }
    
}
