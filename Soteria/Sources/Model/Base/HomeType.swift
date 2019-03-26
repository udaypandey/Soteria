//
//  HomeType.swift
//  Soteria
//
//  Created by Uday Pandey on 26/03/2019.
//  Copyright © 2019 Uday Pandey. All rights reserved.
//

import UIKit

protocol HomeType {
    var id: String { get }
    var name: String { get }

//    func setName(name: String, completion: NetworkCompletion)
}

struct Home: HomeType, Codable {
    var id: String
    var name: String
    
    func setName(name: String, completion: (Any) -> Void) {
    }
}
