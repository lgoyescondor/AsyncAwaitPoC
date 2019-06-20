//
//  Async.swift
//  AsyncAwaitPoC
//
//  Created by Luis David Goyes Garces on 6/20/19.
//  Copyright © 2019 Condor Labs S.A.S. All rights reserved.
//

import Foundation

class Async{
    class func await(_ closure: @escaping () -> (), doFinally: @escaping () -> () = { } ) {
        DispatchQueue.global(qos: .userInitiated).sync {
            closure()
            DispatchQueue.main.async {
                doFinally()
            }
        }
    }
    
    class func await(_ closure: @escaping () throws -> (), onError: (Error) -> (), doFinally: @escaping () -> ()  = { } ) {
        DispatchQueue.global(qos: .userInitiated).sync {
            do {
                try closure()
            } catch {
                onError(error)
            }
            DispatchQueue.main.async {
                doFinally()
            }
        }
    }
}

enum AsyncError: Error {
    case unexpectedResult
}
