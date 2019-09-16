//
//  AlamofireHttpClient.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

private class RequestModel {
    
    let method: HTTPMethod
    let path: String
    let parameters: [String: Any]?
    let encoding: ParameterEncoding
    
    init(method: HTTPMethod,
         path: String,
         parameters: [String: Any]?,
         encoding: ParameterEncoding) {
        
        self.method = method
        self.path = path
        self.parameters = parameters
        self.encoding = encoding
    }
}

class AlamofireHttpClient: HttpClient {
    
    let baseUrl: URL
    let decoder: Decoder
    
    var headers = [String: String]()
    
    required init(baseUrl: URL, decoder: Decoder) {
        self.baseUrl = baseUrl
        self.decoder = decoder
    }
    
    // MARK: - URL
    
    private func absolutePath(_ relativePath: String) -> URL {
        guard !relativePath.isEmpty else {
            return baseUrl
        }
        
        assert(relativePath.first != "/", "url begins from symbol '/' will cause 'RestrictedIP' error")
        
        guard let url = URL(string: relativePath, relativeTo: baseUrl) else {
            assertionFailure("Infeasible to create the url from path: \(relativePath)")
            return baseUrl
        }
        return url
    }
    
    // MARK: - Requests
    
    func get(path: String, parameters: [String: Any]?) -> Promise<Any> {
        let request = RequestModel(method: .get,
                                   path: path,
                                   parameters: parameters,
                                   encoding: URLEncoding.default)
        return self.execute(request).promise
    }
    
    func post(path: String, parameters: [String: Any]?) -> Promise<Any> {
        let request = RequestModel(method: .post,
                                   path: path,
                                   parameters: parameters,
                                   encoding: JSONEncoding.default)
        return self.execute(request).promise
    }
    
    private func execute(_ requestModel: RequestModel) -> (promise: Promise<Any>, cancel: OnCloseBlock) {
        
        let request = Alamofire.request(self.absolutePath(requestModel.path),
                                        method: requestModel.method,
                                        parameters: requestModel.parameters,
                                        encoding: requestModel.encoding,
                                        headers: self.headers)
        
        let promise = Promise<Void>()
            .then(on: .global()) { _ -> Promise<(json: Any, response: PMKAlamofireDataResponse)> in
                return request
                    .validate(contentType: ["application/json"])
                    .responseJSON()
            }
            .then(on: .global() ) { data, response -> Promise<Any> in
                guard data is [String: Any] || data is [Any] else {
                    throw HttpError.parsing(response: data)
                }
                
                if let error = try? self.decoder.decode(BackendError.self, from: data) {
                    let httpStatusCode = response.response?.statusCode
                    throw HttpError.backend(error: error, httpStatusCode: httpStatusCode)
                }
                
                // Custom HTTP response validation
                if let statusCode = response.response?.statusCode, statusCode < 200 || statusCode >= 300 {
                    throw HttpError.validation(statusCode: statusCode, response: data as? CustomStringConvertible)
                }
                
                return .value(data)
        }
        
        return (promise, request.cancel)
    }
}
