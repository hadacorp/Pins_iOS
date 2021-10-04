//
//  FilterController.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/05.
//

import UIKit

class FilterController: UIViewController {
    
    @IBAction func communityFilterBtn(_ sender: Any) {
        print("커뮤니티 필터")
    }
    @IBAction func storyFilterBtn(_ sender: Any) {
        print("스토리 필터")
    }
    @IBAction func backFilterBtn(_ sender: Any) {
        print("back")
        let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "MainVC") as! ViewController
        
        self.navigationController!.pushViewController(VC1, animated: false)
    }
}
