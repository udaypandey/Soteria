//
//  UserType.swift
//  Soteria
//
//  Created by Uday Pandey on 28/03/2019.
//  Copyright © 2019 Uday Pandey. All rights reserved.
//

import Foundation

protocol UserType {
    var id: String { get }
    var name: String { get }
    
    var email: String { get }
    
    //    func setName(name: String, completion: NetworkCompletion)
}

struct User: UserType, Codable {
    var id: String
    var name: String
    var email: String
    
//    func setName(name: String, completion: (Any) -> Void) {
//    }
}
