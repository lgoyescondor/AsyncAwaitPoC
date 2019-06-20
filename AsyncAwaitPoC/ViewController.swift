//
//  ViewController.swift
//  AsyncAwaitPoC
//
//  Created by Luis David Goyes Garces on 6/20/19.
//  Copyright © 2019 Condor Labs S.A.S. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let async = Async()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        oscar()
    }
    
    func oscar() {
        DispatchQueue.main.async {
            
            self.async.await({
                print( self.request1() )
                print( self.request2() )
            })
            
            print("Happening")
            
        }
        
        print("Bitch")
    }
    
    func david() {
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
