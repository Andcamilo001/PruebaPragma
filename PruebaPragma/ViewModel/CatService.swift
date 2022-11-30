
import Foundation
import SwiftUI


struct CatService: CatServiceProtocol {
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T,ErrorCatApi>) -> Void) {
        guard let url = url else {
            let error = ErrorCatApi.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(ErrorCatApi.url(error)))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(ErrorCatApi.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                    
                }catch {
                    completion(Result.failure(ErrorCatApi.parsing(error as? DecodingError)))
                }

            }
        }

        task.resume()
    }
    
    
    func getCats(url: URL?, completion: @escaping(Result<[Cat], ErrorCatApi>) -> Void) {
        guard let url = url else {
            let error = ErrorCatApi.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(ErrorCatApi.url(error)))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(ErrorCatApi.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let breeds = try decoder.decode([Cat].self, from: data)
                    completion(Result.success(breeds))
                    
                }catch {
                    completion(Result.failure(ErrorCatApi.parsing(error as? DecodingError)))
                }
                
                
            }
        }

        task.resume()
        
    }
}
