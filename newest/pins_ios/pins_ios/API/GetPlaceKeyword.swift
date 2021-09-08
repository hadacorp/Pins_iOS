//
//  GetPlaceKeyword.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/08.
//

import UIKit

class GetPlaceKeyword {
    func requestGet(keyword: String, completionHandler: @escaping (Bool, Any) -> Void) {
        let url = "http://bangi98.cafe24.com:8081/home/search/location?keyword=" + keyword
        let encoded = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let myURL = URL(string: encoded!)
        var request = URLRequest(url: myURL!)
        request.addValue("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwMTAtNzc2MC02MzkzIiwicm9sZXMiOlsiUk9MRV9VU0VSIl0sImV4cCI6MTY2MTYxNDI4OH0.Ojb-VgKgoXJSB5Y9u9-165Y2VwLNuP1Pv-KbDeYt_Yg", forHTTPHeaderField: "X-AUTH-TOKEN")

        request.httpMethod = "GET"
        
        print(url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling GET")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            guard let output = try? JSONDecoder().decode([Place].self, from: data) else {
                print("Error: JSON Data Parsing failed")
                return
            }
            
            completionHandler(true, output)
        }.resume()
    }
}
