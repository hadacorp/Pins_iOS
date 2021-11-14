//
//  PostCommunityPin.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/31.
//
import UIKit

class PostCommunityPin {
    var boundary: String!
    var parameters: [String : Any]!
    // image 데이터를 만들기위한 요소들
    var imageData: Data!
    var mimeType: String!
    var filename: String!
    var imageKey: String!
    
    func generateBoundary() -> String {
        return "Boundary-\(UUID().uuidString)"
    }
    
    func makeBody() -> Data {
        var body = Data()
        
        let imgDataKey = "image"
        let boundaryPrefix = "--\(String(describing: boundary))\r\n"
        for (key, value) in parameters {
            body.append(boundaryPrefix.data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
            body.append("\(value)\r\n".data(using: .utf8)!)
            
        }
        body.append(boundaryPrefix.data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"\(imgDataKey)\"; filename=\"\(String(describing: filename))\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: \(String(describing: mimeType))\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n".data(using: .utf8)!)
        body.append("--".appending(boundary.appending("--")).data(using: .utf8)!)
        return body as Data
    }
    
    func requestPost(image: UIImage, params: [String: Any], completionHandler: @escaping (Bool, Any) -> Void) {
        parameters = params
//        imageData = image.pngData()!
        imageData = image.jpegData(compressionQuality: 0.3)!
        mimeType = "image/jpg"
        filename = "odong.jpg"
        imageKey = "image"
        
        // 사전 준비
        boundary = generateBoundary()
        let url = URL(string: "http://bangi98.cafe24.com:8081/pin/communitypin")!
        var request = URLRequest(url: url)
        request.httpMethod = "Post"
        request.addValue("multipart/form-data; boundary=\(String(describing: boundary))", forHTTPHeaderField: "Content-Type")
        request.addValue("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwMTAtNzc2MC02MzkzIiwicm9sZXMiOlsiUk9MRV9VU0VSIl0sImV4cCI6MTY2MTYxNDI4OH0.Ojb-VgKgoXJSB5Y9u9-165Y2VwLNuP1Pv-KbDeYt_Yg", forHTTPHeaderField: "X-AUTH-TOKEN")
        request.httpBody = makeBody()
        
        print(request.httpBody)
        print(request.httpBody! as NSData)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
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
                print(response)
                print("Error: HTTP request failed")
                return
            }
            let output = data
            
            completionHandler(true, output)
        }.resume()
    }
}
