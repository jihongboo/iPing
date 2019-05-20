//
//  Ping.swift
//  Demo
//
//  Created by 纪洪波 on 2018/10/18.
//  Copyright © 2018 Ankit Thakur. All rights reserved.
//

public class iPing: NSObject {
    private var _ping = GBPing()
    private var _totalCount = 0
    private var _currentCount = 0
    private var _delay = 0
    private var _complateBlock: ((Int, CGFloat)->Void)?
    private var _timeout = 0

    public init(host: String) {
        super.init()
        _ping.host = host
        _ping.delegate = self
        _ping.timeout = 5
        _ping.pingPeriod = 0.4
    }

    /// get the average delay and timeout probability
    ///
    /// - Parameters:
    ///   - count: test count
    ///   - complate: delay duration and timeout probability
    public func ping(count: Int, complate: @escaping (Int, CGFloat) -> Void) {
        _totalCount = count
        _complateBlock = complate
        _ping.setup { (success, error) in
            if success {
                self._ping.startPinging()
            }else {
                print(error?.localizedDescription ?? "error")
            }
        }
    }
}

extension iPing: GBPingDelegate {
    public func ping(_ pinger: GBPing, didReceiveReplyWith summary: GBPingSummary) {
        let delay = Int(summary.rtt * 1000)
        self._delay += delay
        _currentCount += 1
        
        if _currentCount >= _totalCount {
            if let block = _complateBlock {
                block(self._delay / _totalCount, CGFloat(_timeout) / CGFloat(_totalCount))
            }
            pinger.stop()
        }
    }
    
    public func ping(_ pinger: GBPing, didReceiveUnexpectedReplyWith summary: GBPingSummary) {
        print("didReceiveUnexpectedReplyWith")
    }
    
    public func ping(_ pinger: GBPing, didTimeoutWith summary: GBPingSummary) {
        print("didTimeoutWith")
        _currentCount += 1
        _timeout += 1
        if _currentCount >= _totalCount {
            if let block = _complateBlock {
                block(self._delay / _totalCount, CGFloat(_timeout) / CGFloat(_totalCount))
            }
            pinger.stop()
        }
    }
    
    public func ping(_ pinger: GBPing, didFailWithError error: Error) {
        print("didFailWithError")
    }
    
    public func ping(_ pinger: GBPing, didFailToSendPingWith summary: GBPingSummary, error: Error) {
        print("didFailToSendPingWith")
    }
}

