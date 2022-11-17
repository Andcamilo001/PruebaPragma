//
//  WebServices.swift
//  PruebaPragma
//
//  Created by Andres Camilo Lezcano on 17/11/22.
//

import Foundation


enum NetworkError: Error {
    
    case badRequest
    case decodingError
}


class Webservice: ObservableObject {
    
    //@Published private(set) var isLoading = false
    
    
    func get<T: Decodable>(url: URL, parse: (Data) -> T?) async throws -> T {
        
        //isLoading = false
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if (response as? HTTPURLResponse)?.statusCode != 200 {
            throw NetworkError.badRequest
        }
        
        //self.isLoading = false
        guard let result = parse(data) else {
            throw NetworkError.decodingError
        }
        
        return result
        
    }
    
}
