//
//  GetKeyword.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/01.
//

import UIKit

class GetKeyword {
    func requestGet(keyword: String, latitude: Double, longitude: Double, completionHandler: @escaping (Bool, Any) -> Void) {
        let keyword = keyword
        let latitude = latitude
        let longitude = longitude
        let meetingPinCategory = "all"
        let meetDate = "all"
        let meetTime = "all"
        let meetGender = "all"
        let meetAge = "all"
        let communityPinCategory = "all"
        let storyPinCategory = "all"
        
        let url = "http://bangi98.cafe24.com:8081/home/search/pinandcardview?latitude=\(latitude)&longitude=\(longitude)&keyword=\(keyword)&meetingPinCategory=" + meetingPinCategory +
            "&meetDate=" + meetDate +
            "&meetTime=" + meetTime +
            "&meetGender=" + meetGender +
            "&meetAge=" + meetAge +
            "&communityPinCategory=" + communityPinCategory +
            "&storyPinCategory=" + storyPinCategory
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
            
            completionHandler(true, output)
        }.resume()
    }
}
