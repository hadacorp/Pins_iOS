//
//  TextField.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/18.
//

import Foundation
import UIKit

// MARK: -Atom
private func DescriptionLabel(text: String) -> UILabel{
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
    label.text = text
    return label
}

private func ContentTextField(placeholder: String) -> UITextField{
    let textField = UITextField()
    textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    textField.font = UIFont(name: "NotoSansKR-Regular", size: 20)
    textField.setPlaceholderColor(#colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
    textField.placeholder = placeholder
    return textField
}

private func DividerLine() -> UIView{
    let line = UIView()
    line.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
    return line
}

// MARK: -Molecules
public func TextForm(descriptionText: String, placeholder: String) -> UIView{
    let parent = UIView()
    let description = DescriptionLabel(text: descriptionText)
    let textField = ContentTextField(placeholder: placeholder)
    let line = DividerLine()
    
    func AddSubviews(){
        parent.addSubview(description)
        parent.addSubview(textField)
        parent.addSubview(line)
    }
    
    func SetAutoLayout(){
        description.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.top.equalTo(0)
        }
        
        textField.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(20)
            make.bottom.equalTo(-4)
        }
        
        line.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(2)
        }
    }
    
    AddSubviews()
    SetAutoLayout()
    
    return parent
}

// MARK: -Organisms
class SignupForm: UIView{
    var phoneNumber = TextForm(descriptionText: "휴대폰 번호", placeholder: "휴대폰 번호")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.AddSubviews()
        self.SetAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func AddSubviews(){
        self.addSubview(phoneNumber)
    }
    
    func SetAutoLayout(){
        phoneNumber.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width - 32)
            make.leading.equalTo(16)
            make.top.equalTo(117)
        }
    }
}
