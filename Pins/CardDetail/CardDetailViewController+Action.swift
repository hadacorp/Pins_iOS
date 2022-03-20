//
//  CardDetailViewController+Action.swift
//  Pins
//
//  Created by judongseok on 2022/02/12.
//

import UIKit

extension CardDetailViewController {
    @objc
    func backBtn() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func moreBtn() {
        let myActionSheet =  UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        myActionSheet.addAction(UIAlertAction(title: "닫기", style: UIAlertAction.Style.cancel, handler: nil))
        myActionSheet.addAction(UIAlertAction(title: "관심 핀에 추가", style: UIAlertAction.Style.default, handler: { (ACTION :UIAlertAction!)in
            print("관심핀에 추가...")
        }))
        myActionSheet.addAction(UIAlertAction(title: "신고", style: UIAlertAction.Style.destructive, handler: { (ACTION :UIAlertAction!)in
            print("신고...")
        }))
        self.present(myActionSheet, animated: true, completion: nil)
    }
    
    func reload() {
        if viewModel.isJoinHidden {
            viewModel.isJoinHidden = false
            joinBackground.setHidden(hidden: viewModel.isJoinHidden)
            return
        }
        else {
            viewModel.isJoinHidden = true
            joinBackground.setHidden(hidden: viewModel.isJoinHidden)
            self.view.endEditing(true)
            return
        }
    }
    
    func rxSetup() {
        joinBtn.rx.tap
            .subscribe(onNext: { [weak self] in self?.reload() })
            .disposed(by: disposeBag)
        
        cancelBtn.rx.tap
            .subscribe(onNext: { [weak self] in self?.reload() })
            .disposed(by: disposeBag)
        
        applyBtn.rx.tap
            .subscribe(onNext: { [weak self] in self?.reload() })
            .disposed(by: disposeBag)
    }
}
