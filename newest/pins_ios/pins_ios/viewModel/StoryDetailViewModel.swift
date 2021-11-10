//
//  StoryDetailViewModel.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/10.
//

import UIKit

class StoryDetailViewModel {
    private var filters: [String] = ["#궁금해요", "#장소리뷰", "#동네꿀팁", "#반려동물", "#취미생활", "#도와줘요", "#사건사고", "#분실/실종", "#잡담"]
    private var filterClicked: Int = -1
    public let nextButton = UIButton()
    
    public func getFilters() -> [String]{
        return filters
    }
    public func getFiltersCount() -> Int{
        return filters.count
    }
    public func getClicked() -> Int{
        return filterClicked
    }
    public func setClicked(count: Int){
        filterClicked = count
    }
    public func activateNextButton(){
        if checkNext(){
            nextButton.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        }
    }
    public func checkNext() -> Bool{
        if filterClicked != -1{
            return true
        }
        return false
    }
    
    public func initNextButton(parent: UIView){
        parent.addSubview(nextButton)
        nextButton.snp.makeConstraints { btn in
            btn.leading.equalTo(16)
            btn.width.equalTo(UIScreen.main.bounds.width - 32)
            btn.height.equalTo(41)
            btn.bottom.equalTo(parent.safeAreaLayoutGuide).offset(-4)
        }
        nextButton.setTitle("다음 단계", for: .normal)
        nextButton.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        nextButton.titleLabel?.textAlignment = .center
        nextButton.titleLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        nextButton.layer.cornerRadius = 8
        nextButton.backgroundColor = #colorLiteral(red: 0.5568627451, green: 0.8156862745, blue: 0.9490196078, alpha: 1)
    }
    
    public func setUI(parent: UIView){
        initNextButton(parent: parent)
    }
}
