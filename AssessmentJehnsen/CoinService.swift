//
//  Service.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 13/03/22.
//

import Foundation

class CoinService {
    public func request<T: Decodable>(_ method: NetworkingMethod = .get, _ endpoint: NetworkingEndpoint, headers: [String: String] = [:], parameters: [String: Any] = [:], responseType: T.Type, completion: @escaping (_ result: Result<T, Error>) -> Void) {

        var defaultHeaders: [String: String] = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]

//        if let authToken = session.authToken, !authToken.isEmpty {
//            defaultHeaders["Authorization"] = "Bearer \(authToken)"
//        }

        guard let url = URL.construct(endpoint) else {
            fatalError("Invalid URL, please check `NetworkingEndpoint`")
        }

        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 60)
        request.allHTTPHeaderFields = defaultHeaders.merging(headers) { (_, value) in value }
        request.httpMethod = method.rawValue.uppercased()

        if method != .get {
            // Non GET method
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } else {
            // GET method
            request.url = URL.construct(endpoint, queries: parameters)
        }

        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                return
            }

            let url = request.url?.absoluteString ?? ""
            var logOutput = "🚀 HTTP_REQUEST: \(method.rawValue) \(url)"
            if method != .get {
                logOutput += " 📦 BODY: \(parameters.debugDescription)"
            }
            if let responseJSON = String(data: data, encoding: .utf8) {
                logOutput += " ✅ JSON: \(responseJSON)"
            }
            print(logOutput)

            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch let error {
                completion(.failure(error))
            }
        })
        task.resume()
    }
}
extension URL {
    static func construct(_ endpoint: NetworkingEndpoint, queries: [String: Any] = [:]) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.coingecko.com/api"
        components.path = "/" + endpoint.value
        components.queryItems = queries.isEmpty ? nil : queries
            .compactMapValues({
                if let value = $0 as? String {
                    return value
                } else {
                    return "\($0)"
                }
            })
            .map({ URLQueryItem(name: $0.key, value: $0.value) })
        return components.url
    }
}

enum NetworkingMethod: String {
    case get, post, patch, put, delete
}

public enum NetworkingEndpoint {

    // Login
    case authPreparation


    var value: String {
        switch self {
        case .authPreparation: return "v1/users/sme/authprep"
        }
    }
}
