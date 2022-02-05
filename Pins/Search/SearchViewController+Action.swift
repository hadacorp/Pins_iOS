//
//  SearchViewController+Action.swift
//  Pins
//
//  Created by judongseok on 2022/01/18.
//

import UIKit

extension SearchViewController {
    func setButtonAction() {
        backBtn()
    }
    
    func backBtn() {
        if let backBtn = UIStorage.shared.getUI(id: "backBtn") as? CustomButton {
            backBtn.rx.tap.bind{ [weak self] in
                self?.presentingViewController?.dismiss(animated: true)
            }
            .disposed(by: disposeBag)
        }
    }
}
