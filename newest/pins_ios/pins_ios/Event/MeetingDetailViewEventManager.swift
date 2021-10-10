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
        viewModel.setHourLabel(string: viewModel.getHour())
    }
    @objc func minusHour(){
        viewModel.minusHour()
        viewModel.setHourLabel(string: viewModel.getHour())
    }
    @objc func plusMinute(){
        viewModel.plusMinute()
        viewModel.setHourLabel(string: viewModel.getHour())
        viewModel.setMinuteLabel(string: viewModel.getMinute())
    }
    @objc func minusMinute(){
        viewModel.minusMinute()
        viewModel.setHourLabel(string: viewModel.getHour())
        viewModel.setMinuteLabel(string: viewModel.getMinute())
    }
    
    public func setButtonEvent(){
        viewModel.getHourPlusBtn().addTarget(self, action: #selector(plusHour), for: .touchUpInside)
        viewModel.getHourMinusBtn().addTarget(self, action: #selector(minusHour), for: .touchUpInside)
        viewModel.getMinutePlusBtn().addTarget(self, action: #selector(plusMinute), for: .touchUpInside)
        viewModel.getMinuteMinusBtn().addTarget(self, action: #selector(minusMinute), for: .touchUpInside)
    }
}
