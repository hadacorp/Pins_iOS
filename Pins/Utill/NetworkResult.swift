//
//  NetworkResult.swift
//  Pins
//
//  Created by judongseok on 2022/01/16.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
