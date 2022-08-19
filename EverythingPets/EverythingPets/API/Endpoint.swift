
import Foundation

enum Endpoint {
    case breeds(page: Int)
    case breedByName(name: String)
    case newImage(id: String)

    var url: String {
        switch self {
        case .breeds:
            return "/v1/breeds"
            
        case .breedByName:
            return "/v1/breeds/search"
            
        case .newImage:
            return "/v1/images/search"
        }
    }
    
    var query: [URLQueryItem] {
        switch self {
        case .breeds(let page):
            return [URLQueryItem(name: "limit", value: "20"), URLQueryItem(name: "page", value: String(page))]
            
        case .breedByName(let name):
            return [URLQueryItem(name: "q", value: name)]
            
        case .newImage(let id):
            return [URLQueryItem(name: "breed_id", value: id)]
        }
    }
}
