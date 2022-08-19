
import Foundation

struct Measure: Codable {
    
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case value = "metric"
    }
}
