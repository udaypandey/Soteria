//
//  Types.swift
//  Soteria
//
//  Created by Uday Pandey on 28/03/2019.
//  Copyright © 2019 Uday Pandey. All rights reserved.
//

import Foundation

public protocol SoteriaError: Error {}

public protocol Resource {
    init?(json: Any)
}

public struct Client {
    var environment: String
    var version: String
    var userAgent: String?
    
    init(environment: String, version: String, userAgent: String? = nil) {
        self.environment = environment
        self.version = version
        self.userAgent = userAgent
    }
}

public typealias ResourceIdentifier = String

public enum RequestMethod: String {
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
    case get = "GET"
}

public struct Request<T: Resource> {
    typealias Body = [String: Any]
    typealias QueryParameters = [String: Any]
    
    var body: Body?
    var queryParameters: QueryParameters?
    var method: RequestMethod
    var client: Client
    var authToken: String?
    
    init(client: Client, method: RequestMethod = .get) {
        self.client = client
        self.method = method
    }
}

public class Response<T: Decodable> {
    var result: Result<T, Error>

    public var value: T? { return try? result.get() }
//
//    public var error: SoteriaError? { return result.error }
//
    init(result: Result<T, Error>) {
        self.result = result
    }
}

public class DetailedResponse<T: Decodable> : Response<T> {
    var httpResponseCode: Int?
    var json: Any?
}

public typealias ResponseHandler<T: Decodable> = (_ result: Response<T>) -> Void


// Notifications

public protocol NotificationIdentifiable {
    var notificationId: String { get }
    var userInfo: [String: Any]? { get }
}

extension NotificationIdentifiable {
    
    public var userInfo: [String: Any]? {
        return nil
    }
}
