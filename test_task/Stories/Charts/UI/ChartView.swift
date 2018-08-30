//
//  ChartView.swift
//  test_task
//
//  Created by Anton on 30.08.2018.
//  Copyright © 2018 iOS Brotherhood. All rights reserved.
//

import UIKit
import Charts
import SnapKit

class ChartView: UIView {
    private(set) lazy var chartView: LineChartView = {
        let chartView = LineChartView()
        chartView.chartDescription?.enabled = false
        chartView.drawGridBackgroundEnabled = true
        chartView.legend.enabled = true
        chartView.xAxis.drawLabelsEnabled = false
        chartView.autoScaleMinMaxEnabled = true
        return chartView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(chartView)
        setupLayout()
        
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ChartView {
    func setupLayout() {
        chartView.snp.makeConstraints { make in
            make.leading.trailing.centerY.centerX.equalToSuperview()
            make.top.bottom.equalTo(layoutMargins).inset(50)
        }
    }
}
