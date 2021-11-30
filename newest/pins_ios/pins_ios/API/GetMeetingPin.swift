//
//  GetMeetingPin.swift
//  pins_ios
//
//  Created by judongseok on 2021/12/01.
//

import UIKit

class GetMeetingPin {
    func requestGet(id: Int, completionHandler: @escaping (Bool, Any) -> Void) {
        let id = id
        
        let url = "http://bangi98.cafe24.com:8081/pin/meetingpin/\(id)"
        let encoded = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let myURL = URL(string: encoded!)
        var request = URLRequest(url: myURL!)
        request.addValue("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwMTAtNzc2MC02MzkzIiwicm9sZXMiOlsiUk9MRV9VU0VSIl0sImV4cCI6MTY2MTYxNDI4OH0.Ojb-VgKgoXJSB5Y9u9-165Y2VwLNuP1Pv-KbDeYt_Yg", forHTTPHeaderField: "X-AUTH-TOKEN")

        request.httpMethod = "GET"
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
            guard let output = try? JSONDecoder().decode([Pin].self, from: data) else {
                print("Error: JSON Data Parsing failed")
                return
            }
            if output.isEmpty{
                completionHandler(false, output)
            }
            else{
                completionHandler(true, output)
            }
        }.resume()
    }
}
