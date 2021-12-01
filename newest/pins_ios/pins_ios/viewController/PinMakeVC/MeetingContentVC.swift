//
//  MeetingContentVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/11.
//

import UIKit

class MeetingContentVC: UIViewController {
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBAction func successBtn(_ sender: Any) {
        if viewModel.getTitleCheck() && viewModel.getContentCheck() {
            MeetingPin.shared.title = titleTextView.text
            MeetingPin.shared.content = contentTextView.text
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
                    for i in self.navigationController!.viewControllers{
                        if let vc = i as? ViewController{
                            vc.paramLatitude = MeetingPin.shared.latitude
                            vc.paramLongitude = MeetingPin.shared.longitude
                            
                            self.navigationController?.popToViewController(vc, animated: true)
                        }
                    }
                }
            }
        }
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    private var viewModel = MeetingContentViewModel()
    
    override func viewDidLoad() {
        // 스크롤 방지
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        setUI()
    }
    
    private func setUI(){
        titleTextView.delegate = self
        contentTextView.delegate = self
        
        titleTextView.tag = 1
        contentTextView.tag = 2
        
        backBtn.setTitleColor(#colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1), for: .normal)
        titleTextView.textContainerInset = .zero
        contentTextView.textContainerInset = .zero
        titleTextView.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        contentTextView.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
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

extension MeetingContentVC: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1) {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.tag == 1 && textView.text.isEmpty {
            textView.text = "제목(4~30글자)"
            textView.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        }
        else if textView.tag == 2 && textView.text.isEmpty {
            textView.text = "내용을 적어주세요"
            textView.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView.tag == 1{
            let newLength = textView.text!.count + text.count - range.length
            
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
            
            return !(newLength >= 30)
        }
        if textView.tag == 2{
            let newLength = textView.text!.count + text.count - range.length
            
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
            return !(newLength >= 300)
            
        }
        return true
    }
}
