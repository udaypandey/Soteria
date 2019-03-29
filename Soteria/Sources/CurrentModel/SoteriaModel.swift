//
//  SoteriaModel.swift
//  Soteria
//
//  Created by Uday Pandey on 28/03/2019.
//  Copyright © 2019 Uday Pandey. All rights reserved.
//

import Foundation

protocol ModelType {
    var homes: [HomeType]? { get }
    var users: [UserType]? { get }
}

class Model: ModelType {
    var homes: [HomeType]?
    
    var users: [UserType]?
}
