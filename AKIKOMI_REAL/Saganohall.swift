//
//  Saganohall.swift
//  AKIKOMI_REAL
//
//  Created by 田中大誓 on 2021/06/08.
//

import UIKit
import MBCircularProgressBar
import Charts

class Saganohall: UIViewController {

    @IBOutlet weak var barChartViewSaganohall: BarChartView!
    @IBOutlet weak var valueSliderSaganoHall: UISlider!
    @IBOutlet weak var SaganoHallCircle: MBCircularProgressBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rawData: [Int] = [20, 50, 70, 30, 60, 90, 40, 50, 60, 70, 50, 40]
        let entries = rawData.enumerated().map { BarChartDataEntry(x: Double($0.offset), y: Double($0.element)) }
        let dataSet = BarChartDataSet(entries: entries)
        let data = BarChartData(dataSet: dataSet)
        barChartViewSaganohall.data = data
        // barの色
        dataSet.colors = [.systemBlue]
        
        // X軸のラベルの位置を下に設定
        barChartViewSaganohall.xAxis.labelPosition = .bottom
        // X軸のラベルの色を設定
        barChartViewSaganohall.xAxis.labelTextColor = .systemGray
        // X軸の線、グリッドを非表示にする
        barChartViewSaganohall.xAxis.drawGridLinesEnabled = false
        barChartViewSaganohall.xAxis.drawAxisLineEnabled = false
        
        // 右側のY座標軸は非表示にする
        barChartViewSaganohall.rightAxis.enabled = false
        
        // Y座標の値が0始まりになるように設定
        barChartViewSaganohall.leftAxis.axisMinimum = 0.0
        barChartViewSaganohall.leftAxis.drawZeroLineEnabled = true
        barChartViewSaganohall.leftAxis.zeroLineColor = .systemGray
        // ラベルの数を設定
        barChartViewSaganohall.leftAxis.labelCount = 5
        // ラベルの色を設定
        barChartViewSaganohall.leftAxis.labelTextColor = .systemGray
        // グリッドの色を設定
        barChartViewSaganohall.leftAxis.gridColor = .systemGray
        // 軸線は非表示にする
        barChartViewSaganohall.leftAxis.drawAxisLineEnabled = false
        
        barChartViewSaganohall.legend.enabled = false
        
        let avg = rawData.reduce(0) { return $0 + $1 } / rawData.count
        let limitLine = ChartLimitLine(limit: Double(avg))
        limitLine.lineColor = .systemOrange
        limitLine.lineDashLengths = [4]
        barChartViewSaganohall.leftAxis.addLimitLine(limitLine)
        
        barChartViewSaganohall.animate(yAxisDuration: 1)

        // Do any additional setup after loading the view.
        initCircleSaganoHall()
    }
    
    @IBAction func SliderviewSaganoHall(_ sender: UISlider) {
        SaganoHallCircle.value = CGFloat(sender.value)
    }
    
    func initCircleSaganoHall() {
        valueSliderSaganoHall.value = 55
        
        SaganoHallCircle.maxValue = CGFloat(valueSliderSaganoHall.maximumValue)
        SaganoHallCircle.value = CGFloat(valueSliderSaganoHall.value)
    }
    

}
