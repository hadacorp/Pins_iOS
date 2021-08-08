//
//  UICollectionView.swift
//  Pins
//
//  Created by judongseok on 2021/07/29.
//

import UIKit

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // 배너 타이머
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 4.5, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    
    public func positionSetting(){
        // auto scroll position 맞춰주기
        if(mainViewBanner.contentOffset.x <= bannerWidth * 4){
            mainViewBanner.contentOffset.x = bannerWidth *  CGFloat((viewModel.numOfBannerImageList * 2 - 1))
        }
        else if(mainViewBanner.contentOffset.x >= bannerWidth * 10){
            mainViewBanner.contentOffset.x = bannerWidth * CGFloat((viewModel.numOfBannerImageList))
        }
    }
    
    // 배너 움직이는 매서드
    func bannerMove() {
        // 자동으로 움직일 때 포지션 맞춰주기
        positionSetting()
        mainViewBanner.scrollRectToVisible(CGRect(x: mainViewBanner.contentOffset.x + bannerWidth, y: 0, width: mainViewBanner.frame.width, height: mainViewBanner.frame.height), animated: true)
        
        // 자동으로 움직일때 페이지 세팅
        nowPage = (Int(mainViewBanner.contentOffset.x / bannerWidth - 5) + 1) % 5
        changeBannerCtrlBtnColor()
    }
    
    // 현재 위치한 인덱스의 버튼 색깔 변경
    func changeBannerCtrlBtnColor(){
        // nowPage를 받아와 해당 인덱스 버튼 background opacity 1
        viewModel.changeBannerCtrlBtnBgColor(cur: nowPage)
    }
    
    //- numOfBannerImageList -> 원활한 스크롤을 위해 3배수 선언
    //- mainViewBanner -> 메인 UICollectionView
    //- BannerCell -> CollectionView에 들어갈 콘텐츠 모델
    
    //컬렉션뷰 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfBannerImageList * 3
    }
    
    //컬렉션뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainViewBanner.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        
        var index = indexPath.item
        if index > viewModel.numOfBannerImageList - 1 {
            index -= viewModel.numOfBannerImageList
        }
        cell.imageView.image = viewModel.bannerImageList[index % viewModel.numOfBannerImageList].image
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout 상속
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.contentOffset = CGPoint(x: Int(bannerWidth) * viewModel.numOfBannerImageList, y: 0)
        return CGSize(width: mainViewBanner.frame.width, height: mainViewBanner.frame.height)
    }
    
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == mainViewBanner{
            
            // 직접 스크롤 했을 때 포지션 세팅
            positionSetting()
            // 직접 스크롤 했을 때 페이지 세팅
            nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
            nowPage = nowPage % viewModel.numOfBannerImageList
            // 스크롤로 변경했을 때 버튼 변경
            changeBannerCtrlBtnColor()
        }
    }
}

