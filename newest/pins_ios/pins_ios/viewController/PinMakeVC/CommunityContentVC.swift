//
//  CommunityContentVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/31.
//

import UIKit

class CommunityContentVC: UIViewController {
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    @IBOutlet weak var textViewName: UITextView!
    @IBOutlet weak var textViewContent: UITextView!
    @IBOutlet weak var textViewRule: UITextView!
    
    @IBOutlet weak var successBtn: UIButton!
    @IBAction func successBtn(_ sender: Any) {
        // API 호출
        PostCommunityPin().requestPost(image: thumb.image!.resize(newWidth: 300),
                                       params: [
                                            "title": "key",
                                            "content": "value",
                                            "setGender": "Male",
                                            "minAge": "20",
                                            "maxAge": "30",
                                            "setLimit": "5",
                                            "participationType": 0,
                                            "profileType": 0,
                                            "detail": "asdf",
                                            "longitude": CommunityPin.shared.longitude!,
                                            "latitude": CommunityPin.shared.latitude!
        ]) { (success, data) in
            print(data)
            print(success)
        }
    }
    
    // image picker
    var picker: UIImagePickerController!
    let btn = UIButton()
    let thumb = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        picker = ViewControllers.shared.picker
        picker.delegate = self
    }
    
    private func setUI(){
        initImageView()
        createTriangle()
        successBtn.setTitleColor(#colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1), for: .normal)
        
        setTextView()
    }
    private func setTextView(){
        textViewName.delegate = self
        textViewContent.delegate = self
        textViewRule.delegate = self
        
        textViewName.tag = 1
        textViewContent.tag = 2
        textViewRule.tag = 3
        
        textViewName.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        textViewContent.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        textViewRule.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        
        textViewName.textContainerInset = .zero
        textViewContent.textContainerInset = .zero
        textViewRule.textContainerInset = .zero
    }
    
    private func initImageView(){
        view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.width.height.equalTo(110)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(104)
            make.centerX.equalTo(view)
        }
        
        btn.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9647058824, blue: 1, alpha: 1)
        btn.layer.cornerRadius = 8
        
        initImageViewIcon(parent: btn)
        initImageViewText(parent: btn)
        btn.addTarget(self, action: #selector(clickImageBtn), for: .touchUpInside)
    }
    private func initImageViewIcon(parent: UIView){
        let mainImg = UIImageView(image: #imageLiteral(resourceName: "iconCamera"))
        parent.addSubview(mainImg)
        mainImg.snp.makeConstraints { make in
            make.width.equalTo(20)
            make.height.equalTo(17)
            make.top.equalTo(39)
            make.centerX.equalTo(parent)
        }
    }
    private func initImageViewText(parent: UIView){
        let text = UILabel()
        parent.addSubview(text)
        text.snp.makeConstraints { make in
            make.width.equalTo(75)
            make.height.equalTo(17)
            make.top.equalTo(56)
            make.centerX.equalTo(parent)
        }
        text.text = "대표 이미지 0/1"
        text.textColor = #colorLiteral(red: 0.5450980392, green: 0.5921568627, blue: 0.6941176471, alpha: 1)
        text.font = UIFont(name: "NotoSansKR-Regular", size: 11)
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
    
    @objc func clickImageBtn(){
        print("Clicked")
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
    }
}

extension CommunityContentVC: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1) {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.tag == 1 && textView.text.isEmpty {
            textView.text = "커뮤니티명(4~12글자)"
            textView.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        }
        else if textView.tag == 2 && textView.text.isEmpty {
            textView.text = "커뮤니티 소개(4~30글자)"
            textView.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        }
        else if textView.tag == 3 && textView.text.isEmpty {
            textView.text = "자세한 소개, 규칙, 조건 등을 적어주세요"
            textView.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView.tag == 1{
            let newLength = textView.text!.count + text.count - range.length
            
            return !(newLength >= 12)
        }
        else if textView.tag == 2{
            let newLength = textView.text!.count + text.count - range.length

            return !(newLength >= 30)
        }
        else if textView.tag == 3{
            let newLength = textView.text!.count + text.count - range.length

            return !(newLength >= 300)
        }
        return true
    }
}
extension CommunityContentVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            for i in btn.subviews{
                i.removeFromSuperview()
            }
            thumb.image = image
            btn.addSubview(thumb)
            thumb.snp.makeConstraints { make in
                make.top.leading.trailing.bottom.equalTo(0)
            }
            thumb.contentMode = .scaleAspectFill
            thumb.clipsToBounds = true
            thumb.layer.cornerRadius = 8
        }
        dismiss(animated: true, completion: nil)
    }
}
