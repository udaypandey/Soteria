//
//  Network.swift
//  Soteria
//
//  Created by Uday Pandey on 26/03/2019.
//  Copyright © 2019 Uday Pandey. All rights reserved.
//

import Foundation
import Moya

extension API: TargetType {
    var base: String { return "https://pastebin.com/raw/A2NBE0RH" }
    var baseURL: URL { return URL(string: base)! }
    
    private struct Path {
        static let homes = ""
        static let events = "events"
        static let devices = "devices"
        static let login = "login"
        static let logout = "logout"
    }
    
    var path: String {
        var endPath: [String?]
        
        switch self {
        case .homes(let home):
            endPath = [Path.homes, home]
        case .devices(let device):
            endPath = [Path.devices, device]
        case .events(let home, let device):
            endPath = [Path.events, home, device]
        case .login:
            endPath = [Path.login]
        case .logout:
            endPath = [Path.logout]
        }
        return endPath.compactMap { $0 }.joined(separator: "/")

    }
    
    var method: Moya.Method {
        return .get
//        switch self {
//        case .devices:
//            return .get
//        case .homes(let home):
//            return .get
//        default:
//            return .get
//        }
    }
    
    var sampleData: Data {
        return "foo".data(using: .utf8)!
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}

struct Network: NetworkType {
    private let provider = MoyaProvider<API>()

    func request<T: Decodable>(_ apiType: API, _ type: T.Type, completion: @escaping NetworkCompletion<T>) -> Void {
        provider.request(apiType) { result in
            var ret: Result<T, Error>
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let resource = try decoder.decode(type, from: response.data)
                    ret = Result.success(resource)
                } catch {
                    ret = Result.failure(error)
                }
                
            case .failure(let error):
                ret = Result.failure(error)
            }
        
            let response = Response(result: ret)
            completion(response)
        }
    }

}

