//
//  CommunityFilterController.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/05.
//

import UIKit

class CommunityFilterController: UIViewController {
    
    @IBAction func mettingFilterBtn(_ sender: Any) {
        let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "MeetingFilterVC") as! MeetingFilterController
        
        self.navigationController!.pushViewController(VC1, animated: false)
    }
    @IBAction func backFilterBtn(_ sender: Any) {
        let controllers = self.navigationController?.viewControllers
        for vc in controllers! {
            if vc is ViewController {
                _ = self.navigationController?.popToViewController(vc as! ViewController, animated: true)
            }
        }
    }
    @IBAction func storyFilterBtn(_ sender: Any) {
        
    }
}
