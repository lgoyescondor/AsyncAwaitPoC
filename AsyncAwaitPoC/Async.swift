//
//  Async.swift
//  AsyncAwaitPoC
//
//  Created by Luis David Goyes Garces on 6/20/19.
//  Copyright © 2019 Condor Labs S.A.S. All rights reserved.
//

import Foundation

class Async{
    func await(_ closure: @escaping () -> () ) {
        DispatchQueue.global(qos: .userInitiated).sync {
            closure()
        }
    }
}

enum AsyncError: Error {
    case unexpectedResult
}
