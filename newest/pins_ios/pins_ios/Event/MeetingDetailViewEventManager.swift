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
        viewModel.setTimeDescription(string: viewModel.getTime())
    }
    @objc func minusHour(){
        viewModel.minusHour()
        viewModel.setHourLabel(string: viewModel.getHour())
        viewModel.setTimeDescription(string: viewModel.getTime())
    }
    @objc func plusMinute(){
        viewModel.plusMinute()
        viewModel.setHourLabel(string: viewModel.getHour())
        viewModel.setMinuteLabel(string: viewModel.getMinute())
        viewModel.setTimeDescription(string: viewModel.getTime())
    }
    @objc func minusMinute(){
        viewModel.minusMinute()
        viewModel.setHourLabel(string: viewModel.getHour())
        viewModel.setMinuteLabel(string: viewModel.getMinute())
        viewModel.setTimeDescription(string: viewModel.getTime())
    }
    
    public func setButtonEvent(){
        viewModel.getHourPlusBtn().addTarget(self, action: #selector(plusHour), for: .touchUpInside)
        viewModel.getHourMinusBtn().addTarget(self, action: #selector(minusHour), for: .touchUpInside)
        viewModel.getMinutePlusBtn().addTarget(self, action: #selector(plusMinute), for: .touchUpInside)
        viewModel.getMinuteMinusBtn().addTarget(self, action: #selector(minusMinute), for: .touchUpInside)
    }
}
