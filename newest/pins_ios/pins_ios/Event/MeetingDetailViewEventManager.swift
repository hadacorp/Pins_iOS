//
//  MeetingDetailViewEventManager.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/10.
//

import UIKit

extension MeetingDetailVC{
    @objc func plusHour(){
        viewModel.plusHour()
    }
    @objc func minusHour(){
        viewModel.minusHour()
    }
    @objc func plusMinute(){
        viewModel.plusMinute()
    }
    @objc func minusMinute(){
        viewModel.minusMinute()
    }
}
