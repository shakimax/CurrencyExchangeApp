//
//  NetworkService.swift
//  ITRTest
//
//  Created by Максим on 16.02.22.
//

import Foundation

final class NetworkService {
    
    static func convert(baseCurrency: String, targetCurrency: String, amountToConvert: Double, completion: @escaping (ConvertedCurrecy?, Error?) -> Void) {
        let apiKey = "cd114ba2adae66812ac0fc54"
        let apiUrl = "https://v6.exchangerate-api.com/v6/\(apiKey)/pair/\(baseCurrency)/\(targetCurrency)/\(amountToConvert)"
        guard let url = URL(string: "\(apiUrl)")
        else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { responseData, response, error in
            if let data = responseData {
                do {
                    let amount = try JSONDecoder().decode(ConvertedCurrecy.self, from: data)
                    completion(amount, nil)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }.resume()
    }
}

