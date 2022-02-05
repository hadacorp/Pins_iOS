//
//  SearchViewController+Action.swift
//  Pins
//
//  Created by judongseok on 2022/01/18.
//

import UIKit

extension SearchViewController {
    @objc
    func backBtn() {
        self.presentingViewController?.dismiss(animated: true)
    }
}
