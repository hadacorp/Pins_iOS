//
//  SearchViewController.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/03.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBAction func backButton(_ sender: Any) {
        //        let transition = CATransition()
        //        transition.duration = 0.25
        //        transition.type = CATransitionType.push
        //        transition.subtype = CATransitionSubtype.fromLeft
        //        self.view.window!.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        // 라이트 모드로 고정
        self.overrideUserInterfaceStyle = .light
        textField.becomeFirstResponder()
        setUI()
        swipeRecognizer()
    }
    
    
    private func setUI(){
        textField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textField.layer.cornerRadius = 16
        textField.layer.borderColor = #colorLiteral(red: 0.3764705882, green: 0.3764705882, blue: 0.3764705882, alpha: 1)
        textField.layer.borderWidth = 1
        textField.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
    
    func swipeRecognizer() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.right:
                // 스와이프 시, 원하는 기능 구현.
                self.dismiss(animated: true, completion: nil)
            default: break
            }
        }
    }
}
