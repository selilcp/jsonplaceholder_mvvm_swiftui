//
//  APILoader.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import Foundation

class APILoader<T: APIHandler> {
    var apiHandler: T
    var urlSession: URLSession
    
    init(apiHandler: T, urlSession: URLSession = .shared) {
        self.apiHandler = apiHandler
        self.urlSession = urlSession
    }
    
    func loadAPIRequest(urlParam urls: [String: String]? = nil,
                        queryParam query: [String: String]? = nil,
                        bodyParam body: [String: Any]? = nil, completionHandler: @escaping (T.ResponseDataType?, APIError?) -> ()) {
        
        if let urlRequest = apiHandler.makeRequest(urlParam: urls,
                                                   queryParam: query,
                                                   bodyParam: body) {
            urlSession.dataTask(with: urlRequest) { (data, response, error) in
                
                if let httpResponse = response as? HTTPURLResponse {
                    
                    guard error == nil, let responseData = data else {
                        completionHandler(nil, APIError(httpStatusCode: httpResponse.statusCode,
                                                        message: error?.localizedDescription))
                        return
                    }
                    
                    do {
                        let parsedResponse = try self.apiHandler.parseResponse(data: responseData,
                                                                               response: httpResponse)
                        completionHandler(parsedResponse, nil)
                    } catch {
                        completionHandler(nil, APIError(httpStatusCode:  httpResponse.statusCode,
                                                         message: error.localizedDescription))
                    }
                    
                }

            }.resume()
        }
    }
}
