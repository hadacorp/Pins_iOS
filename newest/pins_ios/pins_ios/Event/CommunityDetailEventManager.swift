//
//  CommunityDetailEventManager.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/30.
//

import UIKit

extension CommunityDetailVC {
    @objc func nextView(){
        if viewModel.checkNext(){
            // save
            viewModel.saveSetting()
            self.navigationController!.pushViewController(VC1, animated: false)
        }
    }
    public func setButtonEvent(){
        viewModel.getNextBtn().addTarget(self, action: #selector(nextView), for: .touchUpInside)
    }
}
