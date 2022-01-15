//
//  ViewController+Action.swift
//  Pins
//
//  Created by judongseok on 2022/01/13.
//
import MapKit
import UIKit

extension ViewController {
    func getUserLocation() {
        // 위치 요청 시
        let accuracyState = CLLocationManager().accuracyAuthorization
        switch accuracyState {
        case .fullAccuracy:
            print("full")
        case .reducedAccuracy:
            print("reduce")
        @unknown default:
            print("Unknown")
        }
        print("button clicked!")
    }
}
