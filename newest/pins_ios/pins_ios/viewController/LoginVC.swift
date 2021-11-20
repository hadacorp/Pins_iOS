//
//  LoginVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/17.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var whiteButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBAction func signupBtn(_ sender: Any) {
        let signup = self.storyboard!.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(signup, animated: false)
    }
    
    override func viewDidLoad() {
        setUI()
    }
}

// UI
extension LoginVC{
    func setUI(){
        whiteButton.layer.cornerRadius = 8;
        blueButton.layer.cornerRadius = 8;
        
        whiteButton.shadow(x: 0, y: 4, blur: 8, spread: 0, opacity: 0.16)
        blueButton.shadow(x: 0, y: 4, blur: 8, spread: 0, opacity: 0.16)
    }
}
