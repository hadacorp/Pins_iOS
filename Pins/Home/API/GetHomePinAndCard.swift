//
//  GetHomePinAndCard.swift
//  Pins
//
//  Created by judongseok on 2022/01/15.
//

import UIKit
import Alamofire

struct User: Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}

class NetworkService {
    func getHomePinAndCard(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = "https://jsonplaceholder.typicode.com/todos/1"
        var statusCode: Int?
        var responseError: Error?
        var user: User?
        
        let request = AF.request(url, method: .get, encoding: URLEncoding.default)
        
        request.responseDecodable(of: User.self){ data in
            statusCode = data.response?.statusCode
            switch data.result {
            case .success(let response):
                user = response
            case .failure(let error):
                responseError = error
            }
        }.resume()
    }
}
