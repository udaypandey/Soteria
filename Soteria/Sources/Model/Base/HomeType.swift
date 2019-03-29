//
//  HomeType.swift
//  Soteria
//
//  Created by Uday Pandey on 26/03/2019.
//  Copyright © 2019 Uday Pandey. All rights reserved.
//

import Foundation

protocol HomeType {
    var id: String { get }
    var name: String { get }

//    func setName(name: String, completion: NetworkCompletion)
    
    func devices() -> [DeviceType]?
    func events() -> [EventType]?
}

struct Home: HomeType, Codable {
    func devices() -> [DeviceType]? {
        return nil
    }
    
    func events() -> [EventType]? {
        return nil
    }
    
//    var devices: [DeviceType]?
//    var events: [EventType]?
    
    var id: String
    var name: String
    
//    func setName(name: String, completion: (Any) -> Void) {
//    }
}
