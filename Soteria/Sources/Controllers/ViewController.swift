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
        
        network.request(.homes(home: nil), [String: [Home]].self) { response in
            switch response.result {
            case .success(let homes):
                homes.forEach { print ($0)}

            case .failure(let error):
                print(error)
            }
        }
        
//        network.request(.users(user: nil), [User].self) { response in
//            let users = response.value!
//            users.forEach { print ($0)}
//        }
    }
}

