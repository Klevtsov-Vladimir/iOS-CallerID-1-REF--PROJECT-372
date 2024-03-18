import UIKit

var countries = [Cousdnstsrsydffffrrrgdvnjvdjnvdjnv]()

class Network {
    static let shared = Network()
    let downloadGroup = DispatchGroup()
    
    func cdhbchdchdksnkxjskxsjkxsrrjr(callback: @escaping ()->()) {
        if let url = Bundle.main.url(forResource: "CountryCodes", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([CountryCodeElement].self, from: data)
                let jsonSorted = jsonData.sorted(by: {$0.name < $1.name})
                
                
                for element in jsonSorted {
                    var country = Cousdnstsrsydffffrrrgdvnjvdjnvdjnv()
                    country.countr(countr: element)//countries = element
                    guard let url = URL(string: "https://flagsapi.com/\(element.code)/flat/64.png") else { return }
                    
                    self.downloadGroup.enter()
                    
                    self.zxcvbasdfghqwertytgvrdfces(from: url) { [weak self] image in
                        defer {
                            self?.downloadGroup.leave()
                        }
                        country.image(image: image)//imageCountry = image
                        countries.append(country)
                        
                    }
                }
                
                self.downloadGroup.notify(queue: .main) {
                    callback()
                }
            } catch {
                print("error:\(error)")
            }
        }
    }
    
    func ryryeueueijdncbvnjdjdd(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func zxcvbasdfghqwertytgvrdfces(from url: URL, completion: @escaping (UIImage)->()) {
        ryryeueueijdncbvnjdjdd(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            completion(UIImage(data: data) ?? UIImage())
        }
    }
}
