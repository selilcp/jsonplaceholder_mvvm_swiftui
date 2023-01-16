//
//  APIError.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

enum HttpError:Int{
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case tooManyRequest = 429
    case internalServerError = 500
    case badGateway = 502
    case serviceUnavailable = 503
    case timedOut = 504
    case other
}

struct APIError:Error{
    
    private var errorMessage:String?
    var httpError:HttpError
    
    init(httpStatusCode:Int,message:String?){
        errorMessage = message
        httpError = HttpError(rawValue: httpStatusCode) ?? .other
    }
}
