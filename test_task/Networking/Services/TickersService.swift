//
//  TickersService.swift
//  test_task
//
//  Created by Anton on 29.08.2018.
//  Copyright © 2018 iOS Brotherhood. All rights reserved.
//

import RxSwift

struct TickerService {
    let apiClient: ApiClient
    
    init(apiClient: ApiClient = .shared) {
        self.apiClient = apiClient
    }
    
    func tickers() -> Observable<Ticker> {
        let params = [
            "event": "subscribe",
            "channel": "ticker",
            "pair": "BTCUSD"
        ]
        
        return apiClient.connect()
            .flatMap { connected -> Observable<Void> in
                guard connected else { return Observable.empty() }
                return self.apiClient.write(parameters: params)
            }
            .flatMap { _ -> Observable<String> in
                self.apiClient.listen()
            }
            .flatMap { tickerString -> Observable<Ticker> in
                guard let ticker = Ticker(with: tickerString) else { return Observable.empty() }
                return Observable.of(ticker)
            }
    }
}
