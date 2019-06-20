//
//  Async.swift
//  AsyncAwaitPoC
//
//  Created by Luis David Goyes Garces on 6/20/19.
//  Copyright © 2019 Condor Labs S.A.S. All rights reserved.
//

import Foundation

class Async{

    let queue: DispatchQueue
    var value: Any?
    
    init() {
        queue = DispatchQueue(
            label: "coroutine",
            qos: .userInitiated,
            attributes: .concurrent)
    }
    
    func await(_ closure: @escaping () -> () ) {
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.global(qos: .userInitiated).sync {
                self.value = closure()
            }
        }
    }
}

enum AsyncError: Error {
    case unexpectedResult
}
