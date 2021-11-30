//
//  NicknameVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/26.
//

import UIKit

class NicknameVC: UIViewController, BaseViewController {
    var nickCheck = true
    
    let backBtn: UIButton = {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: "btnBack"), for: .normal)
        btn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return btn
    }()
    
    let titleLabel_1: UILabel = {
        let label = UILabel()
        label.text = "본인 인증 완료."
        label.numberOfLines = 2
        label.font = UIFont(name: "NotoSansKR-Medium", size: 20)
        label.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        return label
    }()
    let titleLabel_2: UILabel = {
        let label = UILabel()
        label.text = "사용하실 닉네임을 입력해 주세요!"
        label.numberOfLines = 2
        label.font = UIFont(name: "NotoSansKR-Medium", size: 20)
        label.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        return label
    }()
    
    let nickPlaceholder: UILabel = {
        let placeholder = UILabel()
        
        placeholder.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        placeholder.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        placeholder.text = "닉네임"
        placeholder.textAlignment = .left
        return placeholder
    }()
    
    let nickTextField: UITextField = {
        let textField = UITextField()

        textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        textField.setPlaceholderColor(#colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
        textField.tag = 0
        return textField
    }()
    
    
    let nickLine: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        return line
    }()
    
    let nickDescription: UILabel = {
        let text = UILabel()
        text.text = "한글 닉네임을 권장드려요."
        text.textColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        text.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        return text
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("확인", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        
        button.addTarget(self, action: #selector(nextView), for: .touchUpInside)
        return button
    }()
    
    let nickByte: UILabel = {
        let label = UILabel()
        label.text = "0/16byte"
        label.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        label.textColor = #colorLiteral(red: 0.3764705882, green: 0.3764705882, blue: 0.3764705882, alpha: 1)
        return label
    }()
}

// MARK: - VIewController LifeCycle
extension NicknameVC{
    override func viewDidLoad() {
        setUI()
        nickTextField.becomeFirstResponder()
    }
}

// MARK: - ViewController Setting UI
extension NicknameVC{
    func setUI() {
        self.nickTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        setDelegate()
        addSubViews()
        setLayout()
    }
    
    func setDelegate() {
        nickTextField.delegate = self
    }
    
    func addSubViews() {
        view.addSubview(backBtn)
        view.addSubview(titleLabel_1)
        view.addSubview(titleLabel_2)
        view.addSubview(nickTextField)
        view.addSubview(nickLine)
        nickTextField.addSubview(nickPlaceholder)
        view.addSubview(nickDescription)
        view.addSubview(confirmButton)
        view.addSubview(nickByte)
    }
    
    func setLayout() {
        backBtn.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.width.height.equalTo(48)
        }
        titleLabel_1.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(64)
        }
        titleLabel_2.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(104)
        }
        nickPlaceholder.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.top.equalTo(0)
        }
        nickTextField.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.trailing.equalTo(-95)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(177)
        }
        nickLine.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(210)
            make.height.equalTo(2)
        }
        nickDescription.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(218)
        }
        confirmButton.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(0)
            make.height.equalTo(48)
        }
        nickByte.snp.makeConstraints { make in
            make.trailing.equalTo(-16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(180)
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
    
    func checkNickname(nick: String){
        let pattern = "(?=.*[!@#$%^])"
        print(nick)
        let regex = try? NSRegularExpression(pattern: pattern)
        if let _ = regex?.firstMatch(in: nick, options: [], range: NSRange(location: 0, length: nick.count)) {
            // 있는경우
            errorNickname(type: 0)
            print("특수문자 있어요")
            return
        }
        if nick.contains(" "){
            errorNickname(type: 0)
            return
        }
        PostCheckNickname().requestPost(url: "http://bangi98.cafe24.com:8081/users/nickname", method: "POST",
                                        param: ["nickName": nick]) { [self] (success, data) in
            let bool = String(data: data as! Data, encoding: .utf8).flatMap(Bool.init)
            if bool == false{
                DispatchQueue.main.async {
                    SignupUser.shared.nickName = nick
                    let profileVC = self.storyboard!.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
                    profileVC.paramNick = nick
                    self.navigationController?.pushViewController(profileVC, animated: true)
                }
            }
            else{
                DispatchQueue.main.async {
                    errorNickname(type: 1)
                }
                print("불가능")
            }
        }
    }
    
    func goodNickName(){
        nickPlaceholder.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        nickLine.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        nickDescription.textColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        nickDescription.text! = "한글 닉네임을 권장드려요."
    }
    func errorNickname(type: Int){
        // 특수문자
        if type == 0{
            nickDescription.text! = "띄어쓰기 및 특수문자 사용 불가"
        }
        // 중복
        else if type == 1{
            nickDescription.text! = "이미 사용되고 있는 닉네임입니다."
        }
        else if type == 2{
            nickDescription.text! = "글자수가 초과 됐습니다."
        }
        nickPlaceholder.textColor = #colorLiteral(red: 1, green: 0.3058823529, blue: 0.1607843137, alpha: 1)
        nickLine.backgroundColor = #colorLiteral(red: 1, green: 0.3058823529, blue: 0.1607843137, alpha: 1)
        nickDescription.textColor = #colorLiteral(red: 1, green: 0.3058823529, blue: 0.1607843137, alpha: 1)
    }
    
    @objc
    func nextView(){
        // 뷰 전환
        // 닉네임 체크
        checkNickname(nick: nickTextField.text!)
    }
    
    @objc
    func keyboardWillShow(_ sender: Notification) {
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keybaordRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keybaordRectangle.height
            
            confirmButton.snp.makeConstraints { make in
                make.bottom.equalTo(-keyboardHeight)
            }
        }
    }
    @objc func textFieldDidChange(_ sender: Any?) {
        if self.nickTextField.text!.lengthOfBytes(using: .utf8) <= 16{
            // 나중에 삭제해도 되는 변수
            nickCheck = true
            goodNickName()
        }
        else{
            errorNickname(type: 2)
        }
        nickByte.text = "\(self.nickTextField.text!.lengthOfBytes(using: .utf8))/16byte"
    }
}

// MARK: - ViewController Event Function
extension NicknameVC{
    @objc
    func backAction(){
        self.navigationController?.popViewController(animated: true)
    }
}

extension NicknameVC: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 0{
            placeholderUp(text: nickPlaceholder)
        }
        return true
    }
}
