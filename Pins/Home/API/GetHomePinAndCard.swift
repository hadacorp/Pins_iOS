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

final class NetworkService {
    func getHomePinAndCard() {
        let url = "https://jsonplaceholder.typicode.com/todos/1"
        let param: Parameters = [:]
        
        let request = AF.request(url, method: .get, encoding: URLEncoding.default)
        
        request.responseDecodable(of: User.self){ data in
            print(data)
        }
    }
}
