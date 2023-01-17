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

struct APIError:Error,Identifiable{
    
    private var errorMessage:String?
    var id: Int
    var httpError:HttpError
    
    init(httpStatusCode:Int,message:String?){
        id = httpStatusCode
        errorMessage = message
        httpError = HttpError(rawValue: httpStatusCode) ?? .other
    }
    
    var alertMessage: String {
        switch httpError{
        case .internalServerError : return "Internal server error"
        case .timedOut: return "Time out"
        case .serviceUnavailable: return "Service unavailable"
        case .unauthorized: return "UnAuthorized access"
        default: return "Something went wrong, please try again later"
        }
    }
}
