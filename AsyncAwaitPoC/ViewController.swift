//
//  ViewController.swift
//  AsyncAwaitPoC
//
//  Created by Luis David Goyes Garces on 6/20/19.
//  Copyright © 2019 Condor Labs S.A.S. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        oscar()
    }
    
    func oscar() {
        print("spinner")
        Async.await({
            let result1 = try self.request1()
            let result2 = self.request2()
            
            DispatchQueue.main.async {
                print(result1)
                print(result2)
            }
        }, onError: {
            debugPrint($0)
        }, doFinally: {
            print("A la verga")
        })
    }
    
    func request1() throws -> String {
        sleep(10)
        return "request1"
    }
    
    func request2() -> String {
        sleep(5)
        return "request2"
    }
}

enum URLSessionError : Error {
    case malformedURL
}
