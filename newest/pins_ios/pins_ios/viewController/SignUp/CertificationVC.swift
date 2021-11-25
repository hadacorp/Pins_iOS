//
//  CertificationVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/25.
//

import Foundation
import UIKit

// MARK: - ViewController Main Variable
class CertificationVC: UIViewController, BaseViewController{
    var timer: Timer?
    var timeLeft = 180
    var sampleCode = "123456"
    
    let backBtn: UIButton = {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: "btnBack"), for: .normal)
        btn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return btn
    }()
    
    let titleLabel_1: UILabel = {
        let label = UILabel()
        label.text = "문자로 전송된"
        label.font = UIFont(name: "NotoSansKR-Medium", size: 20)
        label.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        return label
    }()
    let titleLabel_2: UILabel = {
        let label = UILabel()
        label.text = "인증번호 6자리를 입력해 주세요."
        label.font = UIFont(name: "NotoSansKR-Medium", size: 20)
        label.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        return label
    }()
    
    let placeholder: UILabel = {
        let label = UILabel()
        label.text = "인증번호"
        label.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        label.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        return label
    }()
    
    let numberTextField: UITextField = {
        let field = UITextField()
        field.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        field.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        field.keyboardType = .numberPad
        return field
    }()
    
    let line: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        return line
    }()
    
    let resendBtn: UILabel = {
        let label = UILabel()
        label.text = "인증문자 재전송"
        label.textColor = #colorLiteral(red: 0.3764705882, green: 0.3764705882, blue: 0.3764705882, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        label.underline()
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "3:00"
        label.textColor = #colorLiteral(red: 0.3764705882, green: 0.3764705882, blue: 0.3764705882, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        return label
    }()
    
    let failLabel: UILabel = {
        let label = UILabel()
        label.text = "인증번호가 올바르지 않습니다."
        label.textColor = #colorLiteral(red: 1, green: 0.3058823529, blue: 0.1607843137, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        label.layer.opacity = 0
        return label
    }()
}

// MARK: - ViewController LifeCycle
extension CertificationVC{
    override func viewDidLoad() {
        setUI()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        numberTextField.becomeFirstResponder()
    }
}

// MARK: - ViewController Setting UI
extension CertificationVC{
    func setUI() {
        setDelegate()
        addSubViews()
        setLayout()
    }
    
    func setDelegate() {
        numberTextField.delegate = self
    }
    
    func addSubViews() {
        view.addSubview(backBtn)
        view.addSubview(titleLabel_1)
        view.addSubview(titleLabel_2)
        view.addSubview(line)
        view.addSubview(numberTextField)
        numberTextField.addSubview(placeholder)
        view.addSubview(resendBtn)
        view.addSubview(timeLabel)
        view.addSubview(failLabel)
    }
    
    func setLayout() {
        backBtn.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.width.height.equalTo(48)
        }
        titleLabel_2.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(104)
        }
        titleLabel_1.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(64)
        }
        placeholder.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.top.equalTo(0)
        }
        line.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(210)
            make.height.equalTo(2)
        }
        numberTextField.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(177)
        }
        resendBtn.snp.makeConstraints { make in
            make.trailing.equalTo(-16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(218)
        }
        timeLabel.snp.makeConstraints { make in
            make.trailing.equalTo(-16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(180)
        }
        failLabel.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(218)
        }
    }
    
    func placeholderUp(text: UILabel){
        // 애니메이션
        text.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut) {
            text.snp.remakeConstraints {
                $0.top.equalTo(-20)
            }
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func onTimerFires(){
        timeLeft -= 1
        if timeLeft % 60 < 10{
            timeLabel.text = "\(timeLeft / 60):0\(timeLeft % 60)"
        }
        else{
            timeLabel.text = "\(timeLeft / 60):\(timeLeft % 60)"
        }
        if timeLeft <= 0 {
            timer?.invalidate()
            timer = nil
        }
    }
    
    func validation(text: String){
        if text == sampleCode{
            // 화면 전환
            let nickVC = self.storyboard!.instantiateViewController(withIdentifier: "NicknameVC") as! NicknameVC
            self.navigationController?.pushViewController(nickVC, animated: true)
        }
        else{
            placeholder.textColor = #colorLiteral(red: 1, green: 0.3058823529, blue: 0.1607843137, alpha: 1)
            line.backgroundColor = #colorLiteral(red: 1, green: 0.3058823529, blue: 0.1607843137, alpha: 1)
            failLabel.layer.opacity = 1
        }
    }
}

// MARK: - ViewController Event Function
extension CertificationVC{
    @objc
    func backAction(){
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - ViewController Delegate
extension CertificationVC: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        placeholderUp(text: placeholder)
        let newLength = textField.text!.count + string.count - range.length
        if newLength > 5 && textField.text!.count == 5{
            textField.text! += string
            self.view.endEditing(true)
            validation(text: numberTextField.text!)
        }
        else if newLength <= 5{
            return true
        }
        else {
            return false
        }
        return true
    }
}
