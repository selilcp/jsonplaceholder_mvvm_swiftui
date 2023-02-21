//
//  GetUsersHandler.swift
//  Brighthr
//
//  Created by selil on 21/02/23.
//

import Foundation

class GetUsersHandler: APIHandler {
    
    func makeRequest(urlParam urls: [String: String]?,
                     queryParam query: [String : String]?,
                     bodyParam body: [String : Any]?) -> URLRequest? {
        
        let urlString =  APIPath().getUsersList
        if let url = URL(string: urlString) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return urlRequest
        }
        return nil
    }
    
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> [User] {
        return try defaultParseResponse(data: data, response: response)
    }
}
