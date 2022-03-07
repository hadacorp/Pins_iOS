//
//  CardDetailViewController+Action.swift
//  Pins
//
//  Created by judongseok on 2022/02/12.
//

import Foundation

extension CardDetailViewController {
    @objc
    func backBtn() {
        self.navigationController?.popViewController(animated: true)
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
