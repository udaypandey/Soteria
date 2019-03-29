//
//  DeviceType.swift
//  Soteria
//
//  Created by Uday Pandey on 26/03/2019.
//  Copyright © 2019 Uday Pandey. All rights reserved.
//
import Foundation

enum DeviceState {
    case on, off
}

protocol OnOffType {
    var state: DeviceState { get }
    
//    func setState(state: DeviceState, completion: NetworkCompletion)
}

protocol DeviceType: OnOffType, Codable {
    var deviceId: String { get }
    var name: String { get }
    
//    func setName(name: String, completion: NetworkCompletion)
}

//class Device: DeviceType, Codable {
//    var deviceId: String
//    
//    var name: String
//    
//    var state: DeviceState
//    
//}
