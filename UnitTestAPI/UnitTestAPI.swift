//
//  UnitTestAPI.swift
//  UnitTestAPI
//
//  Created by judongseok on 2022/01/15.
//

import XCTest
import Alamofire
@testable import Pins

class UnitTestAPI: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        struct User: Codable {
            var userId: Int
            var id: Int
            var title: String
            var completed: Bool
        }
        
        let url = "https://jsonplaceholder.typicode.com/todos/1"
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        var user: User?
        
        let request = AF.request(url, method: .get, encoding: URLEncoding.default)
        
        request.responseDecodable(of: User.self){ data in
            statusCode = data.response?.statusCode
            switch data.result {
            case .success(let response):
                user = response
                promise.fulfill()
            case .failure(let error):
                responseError = error
            }
        }.resume()
        wait(for: [promise], timeout: 5)
        print(user!)
        
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
