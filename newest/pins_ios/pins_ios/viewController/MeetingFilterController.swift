//
//  FilterController.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/05.
//

import UIKit

class MeetingFilterController: UIViewController {
    
    @IBAction func communityFilterBtn(_ sender: Any) {
        let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "CommunityFilterVC") as! CommunityFilterController
        
        self.navigationController!.pushViewController(VC1, animated: false)
    }
    @IBAction func storyFilterBtn(_ sender: Any) {
        print("스토리 필터")
    }
    @IBAction func backFilterBtn(_ sender: Any) {
        let controllers = self.navigationController?.viewControllers
        for vc in controllers! {
            if vc is ViewController {
                _ = self.navigationController?.popToViewController(vc as! ViewController, animated: true)
            }
        }
    }
}
