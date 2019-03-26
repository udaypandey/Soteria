//
//  ViewController.swift
//  Soteria
//
//  Created by Uday Pandey on 26/03/2019.
//  Copyright © 2019 Uday Pandey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        foo()
    }


    func foo() {
        let network: NetworkType = Network();
        
//        network.request(.homes(home: nil), [Home].self) { homes in
//            homes.map
//        }
        
        network.request(.homes(home: nil), [Home].self) { response in
            let homes = response.value!
            homes.forEach { print ($0)}
            
        }
    }
}

