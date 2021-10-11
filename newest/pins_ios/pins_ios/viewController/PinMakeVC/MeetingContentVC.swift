//
//  MeetingContentVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/11.
//

import UIKit

class MeetingContentVC: UIViewController {
    @IBOutlet weak var successBtn: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBAction func successBtn(_ sender: Any) {
        if viewModel.getTitleCheck() && viewModel.getContentCheck() {
            MeetingPin.shared.title = titleTextField.text
            MeetingPin.shared.content = contentTextField.text
            dump(MeetingPin.shared)
            PostMeetingPin().requestPost(url: "http://bangi98.cafe24.com:8081/pin/meetingpin",
                                         method: "Post",
                                         param: [
                                            "title" : MeetingPin.shared.title!,
                                            "content" : MeetingPin.shared.content!,
                                            "category" : MeetingPin.shared.category!,
                                            "setGender" : MeetingPin.shared.setGender!,
                                            "minAge" : MeetingPin.shared.minAge!,
                                            "maxAge" : MeetingPin.shared.maxAge!,
                                            "setLimit" : MeetingPin.shared.setLimit!,
                                            "longitude" : MeetingPin.shared.longitude!,
                                            "latitude" : MeetingPin.shared.latitude!,
                                            "date" : MeetingPin.shared.date!,
                                            "hour" : MeetingPin.shared.hour!,
                                            "minute" : MeetingPin.shared.minute!,
                                         ]) { (success, data) in
                DispatchQueue.main.async {
                    self.navigationController?.popToRootViewController(animated: true)
                }
            }
        }
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    private var viewModel = MeetingContentViewModel()
    
    override func viewDidLoad() {
        setUI()
    }
    
    private func setUI(){
        titleTextField.delegate = self
        contentTextField.delegate = self
        
        titleTextField.tag = 1
        contentTextField.tag = 2
        
        backBtn.setTitleColor(#colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1), for: .normal)
        
        titleTextField.setPlaceholderColor(#colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
        contentTextField.setPlaceholderColor(#colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
        createTriangle()
    }
    
    public func createTriangle(){
        let whiteTriF = UIImageView(image: UIImage(named: "iconTriangleWhite"))
        let whiteTriS = UIImageView(image: UIImage(named: "iconTriangleWhite"))
        
        self.view.addSubview(whiteTriF)
        self.view.addSubview(whiteTriS)
        
        whiteTriF.snp.makeConstraints { make in
            make.width.equalTo(4)
            make.height.equalTo(6)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(66)
            make.leading.equalTo(UIScreen.main.bounds.width / 3 - 2)
        }
        
        whiteTriS.snp.makeConstraints { make in
            make.width.equalTo(4)
            make.height.equalTo(6)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(66)
            make.trailing.equalTo(-UIScreen.main.bounds.width / 3 + 2)
        }
    }
}

extension MeetingContentVC: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 1{
            let newLength = textField.text!.count + string.count - range.length
            
            if newLength >= 4{
                viewModel.setTitleCheck(bool: true)
            }
            else{
                viewModel.setTitleCheck(bool: false)
            }
            
            if viewModel.getTitleCheck() && viewModel.getContentCheck() {
                backBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            }
            else{
                backBtn.setTitleColor(#colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1), for: .normal)
            }
            
            return !(newLength > 30)
        }
        if textField.tag == 2{
            let newLength = textField.text!.count + string.count - range.length
            
            if newLength > 0{
                viewModel.setContentCheck(bool: true)
            }
            else{
                viewModel.setContentCheck(bool: false)
            }
            
            if viewModel.getTitleCheck() && viewModel.getContentCheck() {
                backBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            }
            else{
                backBtn.setTitleColor(#colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1), for: .normal)
            }
            
        }
        return true
    }
}
