//
//  ChartViewModel.swift
//  test_task
//
//  Created by Anton on 30.08.2018.
//  Copyright © 2018 iOS Brotherhood. All rights reserved.
//

import RxSwift
import RxCocoa
import Charts

class ChartViewModel {
    let disposeBag = DisposeBag()
    let chartItems = BehaviorRelay(value: LineChartData())
    let service: TickerService
    
    init(service: TickerService = TickerService()) {
        self.service = service
        configureBehaviorRelay()
    }
}

private extension ChartViewModel {
    func configureBehaviorRelay() {
        service.tickers()
            .do(onNext: { print($0) })
            .map { ChartDataEntry(x: $0.createdAt.timeIntervalSince1970, y: $0.lastPrice) }
            .map { dataEntry -> LineChartData in
                let dataSet = self.chartItems.value.dataSets.first ?? LineChartDataSet(values: [], label: "Ticker price")
                _ = dataSet.addEntry(dataEntry)
                return LineChartData(dataSets: [dataSet])
            }
            .bind(to: chartItems)
            .disposed(by: disposeBag)
    }
}
