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
        
        let async = Async()
        async.await({
            
            DispatchQueue.main.async {
                print( self.request1() )
            }
            
            DispatchQueue.main.async {
                print( self.request2() )
            }
        })

        print("Culito")
    }
    
    func culito() -> Any {
        return "Oscar Tomas"
    }
    
    func request1() -> String {
        sleep(2)
        return "request1"
    }
    
    func request2() -> String {
        sleep(1)
        return "request2"
    }
}

enum URLSessionError : Error {
    case malformedURL
}
