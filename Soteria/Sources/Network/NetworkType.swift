//
//  Network.swift
//  Soteria
//
//  Created by Uday Pandey on 26/03/2019.
//  Copyright © 2019 Uday Pandey. All rights reserved.
//

import Foundation

typealias NetworkCompletion<T: Decodable> = (_ response: Response<T>) -> Void

enum API {
    case login(userName: String, password: String)
    case logout
    
    case homes(home: ResourceIdentifier?)
    case devices(home: ResourceIdentifier)
    case events(home: ResourceIdentifier, device: ResourceIdentifier?)
}

protocol NetworkType {
    func request<T: Decodable>(_ apiType: API, _ type: T.Type, completion: @escaping NetworkCompletion<T>) -> Void
}

