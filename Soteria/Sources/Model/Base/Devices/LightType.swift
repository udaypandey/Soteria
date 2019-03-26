//
//  LightType.swift
//  Soteria
//
//  Created by Uday Pandey on 26/03/2019.
//  Copyright © 2019 Uday Pandey. All rights reserved.
//

import Foundation

protocol LightType: DeviceType {
    var color: String { get }
    
//    func setColor(name: String, completion: NetworkCompletion)
}

