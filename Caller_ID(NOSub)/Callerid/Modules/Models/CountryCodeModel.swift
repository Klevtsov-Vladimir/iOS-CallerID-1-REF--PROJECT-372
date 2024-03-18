import Foundation

struct CountryCodeElementcvcvcvccbgggf: Codable {
    let name, dialCode, code: String

    enum CodingKeys: String, CodingKey {
        case name
        case dialCode = "dial_code"
        case code
    }
}

typealias CountryCodeModel = [CountryCodeElementcvcvcvccbgggf]
