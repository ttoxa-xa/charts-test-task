//
//  ApiClient.swift
//  test_task
//
//  Created by Anton on 29.08.2018.
//  Copyright © 2018 iOS Brotherhood. All rights reserved.
//

import UIKit
import RxStarscream
import Starscream
import RxSwift

struct ApiClient {
    static let shared = ApiClient()
    private let socketHost = "wss://api.bitfinex.com/ws"
    private let webSoсket: WebSocket
    private let disposeBag = DisposeBag()
    
    init() {
        /// тут можно и упасть, так как подразумевается, что url должен быть всегда правильный
        guard let url = URL(string: socketHost) else { fatalError("invalid socket url") }
        webSoсket = WebSocket(url: url)
    }
    
    func connect() -> Observable<Bool> {
        webSoсket.connect()
        return webSoсket.rx
            .connected
            .throttle(RxTimeInterval(5), scheduler: MainScheduler.instance)
            .do(onNext: { connected in
                guard !connected else { return }
                self.webSoсket.connect()
            })
    }
    
    func write(parameters: [String: Any]) -> Observable<Void> {
        return webSoсket.rx.write(string: parameters.jsonString() ?? "")
    }
}
