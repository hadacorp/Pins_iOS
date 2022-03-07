//
//  JoinView+UITextView.swift
//  Pins
//
//  Created by judongseok on 2022/03/07.
//
import UIKit

extension CardDetailViewController: UITextViewDelegate {
    
    // TextView Place Holder
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        
    }
    // TextView Place Holder
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "제가 바로 PlaceHolder입니다."
            textView.textColor = UIColor.lightGray
        }
    }
    
    // keyboard up down
    func setNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    func keyboardWillShow(_ sender: Notification) {
        if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.whiteCard.snp.updateConstraints {
                $0.bottom.equalTo(-keyboardSize.height - 24)
                $0.leading.equalTo(16)
                $0.trailing.equalTo(-16)
                $0.height.equalTo(296)
            }
        }
    }
    
    @objc
    func keyboardWillHide(_ sender: Notification) {
        self.whiteCard.snp.updateConstraints {
            $0.bottom.equalTo(self.view.safeAreaInsets).offset(-224)
            $0.leading.equalTo(16)
            $0.trailing.equalTo(-16)
            $0.height.equalTo(296)
        }
    }
}
