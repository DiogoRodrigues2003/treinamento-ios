
import Foundation

typealias SuccessResult<T: Decodable> = (T) -> Void
typealias FailureResult = (APIError) -> Void

enum BaseUrl {
    case dog
    case cat
    
    var baseUrl: String {
        switch self {
        case .dog:
            return "api.thedogapi.com"
            
        case .cat:
            return "api.thecatapi.com"
        }
    }
    
    var key: String {
        switch self {
        case .dog:
            return "dc9c3284-f550-45e3-a1b3-2b2536621b77"
            
        case .cat:
            return "0fa5d09e-ca36-45d4-a0d7-3c941d8c6dab"
        }
    }
}

class API {
    
    func request<T: Decodable>(
        api: BaseUrl,
        endpoint: Endpoint,
        method: HTTPMethod = .get,
        success: @escaping SuccessResult<T>,
        failure: @escaping FailureResult
    ) {
        guard let url = urlConstructor(baseUrl: api.baseUrl, endpoint: endpoint.url, queryItems: endpoint.query) else {
            failure(.badUrl(string: api.baseUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        request.setValue(api.key, forHTTPHeaderField: "x-api-key")
           
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                failure(.requestFailed(error: error))
                return
            }
            
            guard let data = data else {
                failure(.invalidData)
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                success(decodedData)
            } catch {
                failure(.decodeFailed(error: error, textData: String(data: data, encoding: .utf8)))
            }
        }.resume()
        
    }
}
