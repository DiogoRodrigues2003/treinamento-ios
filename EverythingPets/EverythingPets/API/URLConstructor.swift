
import Foundation

func urlConstructor(baseUrl: String, endpoint: String, queryItems: [URLQueryItem]) -> URL? {
    var components = URLComponents()
    components.scheme = "https"
    components.host = baseUrl
    components.path = endpoint
    components.queryItems = queryItems
    
    return components.url
}

