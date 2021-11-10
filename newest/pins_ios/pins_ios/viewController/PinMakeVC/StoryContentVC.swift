//
//  StoryContentVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/11.
//

import UIKit

class StoryContentVC: UIViewController {
    @IBOutlet weak var successBtn: UIButton!
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var titleTextView: UITextView!
    override func viewDidLoad() {
        setUI()
    }
    
    func setUI(){
        titleTextView.delegate = self
        contentTextView.delegate = self
        
        titleTextView.tag = 1
        contentTextView.tag = 2
        
        successBtn.setTitleColor(#colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1), for: .normal)
        titleTextView.textContainerInset = .zero
        contentTextView.textContainerInset = .zero
        
        titleTextView.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        contentTextView.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    }
}
extension StoryContentVC: UITextViewDelegate{
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
}
