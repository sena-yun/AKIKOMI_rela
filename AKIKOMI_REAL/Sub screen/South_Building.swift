//
//  South_Building.swift
//  AKIKOMI_REAL
//
//  Created by 田中大誓 on 2021/06/08.
//

import UIKit
import MBCircularProgressBar
import Charts

class South_Building: UIViewController {
    
    @IBOutlet weak var barChartViewSouthBuilding: BarChartView!
    @IBOutlet weak var valueSliderSouthBuilding: UISlider!
    @IBOutlet weak var SouthBuildingCircle: MBCircularProgressBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rawData: [Int] = [20, 50, 70, 30, 60, 90, 40, 50, 60, 70, 50, 40]
        let entries = rawData.enumerated().map { BarChartDataEntry(x: Double($0.offset), y: Double($0.element)) }
        let dataSet = BarChartDataSet(entries: entries)
        let data = BarChartData(dataSet: dataSet)
        barChartViewSouthBuilding.data = data
        // barの色
        dataSet.colors = [.systemBlue]
        
        // X軸のラベルの位置を下に設定
        barChartViewSouthBuilding.xAxis.labelPosition = .bottom
        // X軸のラベルの色を設定
        barChartViewSouthBuilding.xAxis.labelTextColor = .systemGray
        // X軸の線、グリッドを非表示にする
        barChartViewSouthBuilding.xAxis.drawGridLinesEnabled = false
        barChartViewSouthBuilding.xAxis.drawAxisLineEnabled = false
        
        // 右側のY座標軸は非表示にする
        barChartViewSouthBuilding.rightAxis.enabled = false
        
        // Y座標の値が0始まりになるように設定
        barChartViewSouthBuilding.leftAxis.axisMinimum = 0.0
        barChartViewSouthBuilding.leftAxis.drawZeroLineEnabled = true
        barChartViewSouthBuilding.leftAxis.zeroLineColor = .systemGray
        // ラベルの数を設定
        barChartViewSouthBuilding.leftAxis.labelCount = 5
        // ラベルの色を設定
        barChartViewSouthBuilding.leftAxis.labelTextColor = .systemGray
        // グリッドの色を設定
        barChartViewSouthBuilding.leftAxis.gridColor = .systemGray
        // 軸線は非表示にする
        barChartViewSouthBuilding.leftAxis.drawAxisLineEnabled = false
        
        barChartViewSouthBuilding.legend.enabled = false
        
        let avg = rawData.reduce(0) { return $0 + $1 } / rawData.count
        let limitLine = ChartLimitLine(limit: Double(avg))
        limitLine.lineColor = .systemOrange
        limitLine.lineDashLengths = [4]
        barChartViewSouthBuilding.leftAxis.addLimitLine(limitLine)
        
        barChartViewSouthBuilding.animate(yAxisDuration: 1)

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
