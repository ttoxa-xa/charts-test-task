//
//  TickerController.swift
//  test_task
//
//  Created by Anton on 30.08.2018.
//  Copyright © 2018 iOS Brotherhood. All rights reserved.
//

import UIKit
import RxSwift

class ChartController: UIViewController {
    let contentView = ChartView()
    let viewModel = ChartViewModel()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        view = contentView
        
        viewModel.chartItems.subscribe(onNext: { data in
            self.contentView.chartView.data = data
        }).disposed(by: disposeBag)
    }
}
