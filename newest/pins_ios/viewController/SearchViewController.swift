//
//  SearchViewController.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/03.
//

import UIKit

class SearchViewController: UIViewController {
    // MARK:- IB Something
    @IBOutlet weak var textField: UITextField!
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }
    // MARK:- Public
    public var viewModel = SearchViewModel(parent: nil, layout: nil)
    
    // MARK:- Function
    override func viewDidLoad() {
        // 라이트 모드로 고정
        self.overrideUserInterfaceStyle = .light
        textField.becomeFirstResponder()
        
        viewModel = SearchViewModel(parent: self.view, layout: self.view.safeAreaLayoutGuide)
        
        // 버튼 이벤트 세팅
        setButtonEvent()
        // UI 세팅
        setUI()
        // 뒤로가기 제스쳐
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
    
    // 뒤로가기 제스쳐
    private func swipeRecognizer() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    private func setButtonEvent(){
        viewModel.getCancel().addTarget(self, action: #selector(self.cancelButton), for: .touchUpInside)
    }
}
