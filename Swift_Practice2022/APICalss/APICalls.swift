//
//  APICalls.swift
//  Swift_Practice2022
//
//  Created by Ravikumar on 23/05/22.
//

import Foundation
import Alamofire

    //... Generic Service Call for POST or GET
     func sendRequest<T: Decodable>(for: T.Type = T.self,
                                          url: String,
                                          method: String,
                                          headers: HTTPHeaders? = nil,
                                          body: [String:String],
                                          completion: @escaping (Result<T>) -> Void) {
        
        let url =  url
        let body = body
        let url1 = URL(string: url)
        
        var request = URLRequest(url: url1!)
        request.httpMethod = method
        request.httpBody = try! JSONEncoder().encode(body)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    print("Data is not received")
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                try completion(.success(decoder.decode(T.self, from: data)))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }
        task.resume()
    }
