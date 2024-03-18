import UIKit

struct Cousdnstsrsydffffrrrgdvnjvdjnvdjnv {
    var countries: CountryCodeElement?
    var imageCountry: UIImage?
    
    init(countries: CountryCodeElement? = nil, imageCountry: UIImage? = nil) {
        self.countries = countries
        self.imageCountry = imageCountry
    }
    
    mutating func countr(countr: CountryCodeElement) {
        countries = countr
    }
    
    mutating func image(image: UIImage) {
        imageCountry = image
    }
}
