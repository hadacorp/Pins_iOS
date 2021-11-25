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
    let backBtn: UIButton = {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: "btnBack"), for: .normal)
        btn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return btn
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "문자로 전송된\n인증번호 6자리를 입력해 주세요."
        label.numberOfLines = 2
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
}

// MARK: - ViewController LifeCycle
extension CertificationVC{
    override func viewDidLoad() {
        setUI()
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
        view.addSubview(titleLabel)
        view.addSubview(line)
        view.addSubview(numberTextField)
        numberTextField.addSubview(placeholder)
        view.addSubview(resendBtn)
    }
    
    func setLayout() {
        backBtn.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.width.height.equalTo(48)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(64)
            make.height.equalTo(69)
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
        return true
    }
}
