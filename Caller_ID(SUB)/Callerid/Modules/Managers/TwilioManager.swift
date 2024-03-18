import Foundation

final class TwilioManager {
    static let shared = TwilioManager()

    func chddeswckSMS(code: String, phone: String, completion: @escaping (String)->()) {
        let url = URL(string: "https://verify.twilio.com/v2/Services/\(sidServiceVerifySms)/VerificationCheck")!

        let username = sidTwilio
        let password = authTokenTwilio
        let loginString = String(format: "\(username):\(password)", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Basic \(base64LoginString)"
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = ("To=%2B\(phone)&Code=" + code).data(using: .utf8)

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
            } else if let data = data {
                let status = (try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any])?["status"] as? String
                completion(status ?? "")
            }
        }

        task.resume()
    }
    
    func sefbgrndSMS(phone: String, completion: @escaping (Result<String, Error>)->()) {
        let data = NSMutableData(data: "To=%2B\(phone)".data(using: .utf8)!)
        data.append("&Channel=sms".data(using: .utf8)!)

        let url = URL(string: "https://verify.twilio.com/v2/Services/\(sidServiceVerifySms)/Verifications")!

        let username = sidTwilio
        let password = authTokenTwilio
        let loginString = String(format: "\(username):\(password)", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Basic \(base64LoginString)"
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = data as Data

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
                completion(.failure(error))
            } else if let data = data {
                let str = String(data: data, encoding: .utf8)
                completion(.success(str ?? ""))
                print(str ?? "")
            }
        }

        task.resume()
    }
}
