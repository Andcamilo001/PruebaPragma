

import Foundation


enum ErrorCatApi: Error/*, CustomStringConvertible*/ {
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var localizedDescription: String {

        switch self {
        case .badURL, .parsing, .unknown:
            return "Something is wrong."
        case .badResponse(_):
            return "Fail conection"
        case .url(let error):
            return error?.localizedDescription ?? "Something is wrong."
        }
    }
    
    var description: String {

        switch self {
        case .unknown: return "unknown error"
        case .badURL: return "invalid URL"
        case .url(let error):
            return error?.localizedDescription ?? "url session error"
        case .parsing(let error):
            return "parsing error \(error?.localizedDescription ?? "")"
        case .badResponse(statusCode: let statusCode):
            return "bad response with status code \(statusCode)"
        }
    }
}
