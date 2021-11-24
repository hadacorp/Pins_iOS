//
//  SignUpVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/21.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func dismissSecondViewController(mobileType: String)
}

class SignUpVC: UIViewController, BaseViewController{
    // MARK: -ViewController LifeCycle
    override func viewDidLoad() {
        setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.nameTextField.becomeFirstResponder()
    }
    
    // MARK: -Param Variable
    public var paramMobile: String?
    
    // MARK: -Initial UI
    let nameLine: UIView = {
        let line = UIView()
        
        line.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        return line
    }()
    
    let nameLineFocus: UIView = {
        let line = UIView()
        line.tag = -1
        line.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        return line
    }()
    
    let mobileTouchArea: UIButton = {
        let btn = UIButton()
        
        btn.layer.opacity = 0
        btn.addTarget(self, action: #selector(openHalfmodal), for: .touchUpInside)
        return btn
    }()
    
    let backBtn: UIButton = {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: "btnBack"), for: .normal)
        btn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return btn
    }()
    
    let phoneNumberPlaceholder: UILabel = {
        let placeholder = UILabel()

        placeholder.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        placeholder.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        placeholder.text = "휴대폰 번호"
        placeholder.textAlignment = .left
        placeholder.layer.opacity = 0
        return placeholder
    }()
    
    let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        
        textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        textField.setPlaceholderColor(#colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
        textField.tag = 4
        textField.layer.opacity = 0
        return textField
    }()
    
    let phoneNumberLine: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        line.layer.opacity = 0
        return line
    }()
    
    let phoneNumberLineFocus: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        return line
    }()
    
    let namePlaceholder: UILabel = {
        let placeholder = UILabel()

        placeholder.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        placeholder.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        placeholder.text = "이름"
        placeholder.textAlignment = .left
        return placeholder
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        
        textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        textField.setPlaceholderColor(#colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
        textField.tag = 1
        
        return textField
    }()
    
    let nameSuccess: UIButton = {
        let button = UIButton()
        
        button.setTitle("확인", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        
        button.addTarget(self, action: #selector(nameDownAction), for: .touchUpInside)
        return button
    }()
    
    let mainTitle: UILabel = {
        let title = UILabel()
        
        title.text = "이름을 입력해 주세요."
        title.font = UIFont(name: "NotoSansKR-Medium", size: 20)
        title.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        return title
    }()
    
    let idcardFirstPlaceholder: UILabel = {
        let placeholder = UILabel()

        placeholder.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        placeholder.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        placeholder.text = "주민등록번호"
        placeholder.textAlignment = .left
        placeholder.layer.opacity = 0
        return placeholder
    }()
    
    let idcardFirstTextField: UITextField = {
        let textField = UITextField()
        
        textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        textField.setPlaceholderColor(#colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
        textField.tag = 2
        textField.layer.opacity = 0
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let idLineFirst: UIView = {
        let line = UIView()
        
        line.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        line.layer.opacity = 0
        return line
    }()
    
    let idLineFirstFocus: UIView = {
        let line = UIView()
        
        line.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        return line
    }()
    
    let idSlashFirst: UIView = {
        let line = UIView()
        
        line.backgroundColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        line.layer.opacity = 0
        return line
    }()
    
    let idcardLastTextField: UITextField = {
        let textField = UITextField()
        
        textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.textAlignment = .center
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        textField.setPlaceholderColor(#colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
        textField.tag = 3
        textField.layer.opacity = 0
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let idLineLast: UIView = {
        let line = UIView()
        
        line.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        line.layer.opacity = 0
        return line
    }()
    
    let idLineLastFocus: UIView = {
        let line = UIView()
        
        line.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        return line
    }()
    
    let idDots: UIView = {
        let background = UIView()
        let gap = (UIScreen.main.bounds.width / 2 - 163) / 6
        for i in 0..<6 {
            let dot = UIView()
            background.addSubview(dot)
            dot.snp.makeConstraints { make in
                make.leading.equalTo(gap + CGFloat(CGFloat(16 + gap) * CGFloat(i)))
                make.top.equalTo(0)
                make.width.height.equalTo(16)
            }
            dot.backgroundColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
            dot.layer.cornerRadius = 8
        }
        background.layer.opacity = 0
        return background
    }()
    
    let mobileLine: UIView = {
        let line = UIView()
        
        line.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        line.layer.opacity = 0
        return line
    }()
    
    let mobilePlaceholder: UILabel = {
        let label = UILabel()
        
        label.text = "통신사"
        label.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        label.layer.opacity = 0
        return label
    }()
    
    let mobileLabel: UILabel = {
        let label = UILabel()
        
        label.text = " "
        label.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        label.layer.opacity = 0
        return label
    }()
    
    let mobileUnfold: UIImageView = {
        let image = UIImageView()
        
        image.image = #imageLiteral(resourceName: "unfold")
        image.layer.opacity = 0
        return image
    }()
}

// MARK: -Extension
extension SignUpVC: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = textField.text!.count + string.count - range.length
        if textField.tag == 1{
            placeholderUp(text: namePlaceholder)
        }
        if textField.tag == 2{
            placeholderUp(text: idcardFirstPlaceholder)
            
            if newLength > 5 && textField.text!.count == 5{
                textField.text! += string
                idcardLastTextField.becomeFirstResponder()
            }
            else if newLength <= 5{
                return true
            }
            else {
                return false
            }
        }
        if textField.tag == 3{
            if newLength > 0{
                textField.text = string
                idcardDownAction()
            }
        }
        if textField.tag == 4{
            placeholderUp(text: phoneNumberPlaceholder)
            let text = textField.text
            textField.text = text!.applyPatternOnNumbers(pattern: "###-####-####", replacementCharacter: "#")
            if newLength > 12 && textField.text!.count == 12{
                textField.text! += string
                print("End")
                self.view.endEditing(true)
            }
            else if newLength <= 12{
                return true
            }
            else {
                return false
            }
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 1{
            if nameLineFocus.tag != -1{
                lineFocus(line: nameLineFocus, width: UIScreen.main.bounds.width - 32)
            }
        }
        else if textField.tag == 2{
            lineFocus(line: idLineFirstFocus, width: UIScreen.main.bounds.width / 2 - 40)
        }
        else if textField.tag == 3{
            lineFocus(line: idLineLastFocus, width: 27)
        }
        else if textField.tag == 4{
            lineFocus(line: phoneNumberLineFocus, width: UIScreen.main.bounds.width - 32)
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 1{
            lineUnfocus(line: nameLineFocus)
        }
        else if textField.tag == 2{
            lineUnfocus(line: idLineFirstFocus)
        }
        else if textField.tag == 3{
            lineUnfocus(line: idLineLastFocus)
        }
        else if textField.tag == 4{
            lineUnfocus(line: phoneNumberLineFocus)
        }
    }
}
