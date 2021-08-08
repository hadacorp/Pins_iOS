//
//  PinMaker.swift
//  pins_ios
//
//  Created by judongseok on 2021/08/08.
//

import UIKit
import MapKit

class PinMaker: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    let subtitle: String?
    
    init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        
        super.init()
    }
}
