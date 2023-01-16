//
//  AppEnvironment.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

struct AppEnvironment {
    private let baseURL = "https://jsonplaceholder.typicode.com/"
    
    func getBaseURL() -> String{
        return baseURL
    }
}
