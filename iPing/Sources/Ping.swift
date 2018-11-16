//
//  Ping.swift
//  Demo
//
//  Created by 纪洪波 on 2018/10/18.
//  Copyright © 2018 Ankit Thakur. All rights reserved.
//

import UIKit

class Ping: NSObject {
    var ping = GBPing()
    
    private var totalCount = 0
    private var currentCount = 0
    private var delay = 0
    private var complateBlock: ((Int, CGFloat)->Void)?
    private var timeout = 0

    init(host: String!) {
        super.init()
        ping.host = host
        ping.delegate = self
        ping.timeout = 5
        ping.pingPeriod = 0.4
    }

    func ping(count: Int, complate: @escaping (Int, CGFloat)->Void) -> GBPing {
        totalCount = count
        complateBlock = complate
        ping.setup { (success, error) in
            if success {
                self.ping.startPinging()
            }else {
                print(error?.localizedDescription ?? "error")
            }
        }
        return ping
    }
}

extension Ping: GBPingDelegate {
    func ping(_ pinger: GBPing, didReceiveReplyWith summary: GBPingSummary) {
        let delay = Int(summary.rtt * 1000)
        self.delay += delay
        currentCount += 1
        
        if currentCount >= totalCount {
            if let block = complateBlock {
                block(self.delay / totalCount, CGFloat(timeout) / CGFloat(totalCount))
            }
            pinger.stop()
        }
    }
    
    func ping(_ pinger: GBPing, didReceiveUnexpectedReplyWith summary: GBPingSummary) {
        print("didReceiveUnexpectedReplyWith")
    }
    
    func ping(_ pinger: GBPing, didTimeoutWith summary: GBPingSummary) {
        print("didTimeoutWith")
        currentCount += 1
        timeout += 1
        if currentCount >= totalCount {
            if let block = complateBlock {
                block(self.delay / totalCount, CGFloat(timeout) / CGFloat(totalCount))
            }
            pinger.stop()
        }
    }
    
    func ping(_ pinger: GBPing, didFailWithError error: Error) {
        print("didFailWithError")
    }
    
    func ping(_ pinger: GBPing, didFailToSendPingWith summary: GBPingSummary, error: Error) {
        print("didFailToSendPingWith")
    }
}

