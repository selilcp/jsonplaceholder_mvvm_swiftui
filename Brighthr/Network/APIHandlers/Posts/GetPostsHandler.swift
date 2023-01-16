//
//  GetPostsHandler.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import Foundation

class GetPostsHandler: APIHandler {
    
    func makeRequest(urlParam urls: [String: String]?,
                     queryParam query: [String : String]?,
                     bodyParam body: [String : Any]?) -> URLRequest? {
        
        var urlString =  APIPath().getPost
        if let urlParam = urls{
            updateURL(url: &urlString, replacemetValues: urlParam)
        }
        if let url = URL(string: urlString) {
            var urlRequest = URLRequest(url: url)
            setDefaultHeaders(request: &urlRequest)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return urlRequest
        }
        return nil
    }
    
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> [Post] {
        return try defaultParseResponse(data: data, response: response)
    }
}
