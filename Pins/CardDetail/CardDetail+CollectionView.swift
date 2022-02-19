//
//  CardDetail+Collection.swift
//  Pins
//
//  Created by judongseok on 2022/02/19.
//

import UIKit

extension CardDetailViewController: UICollectionViewDataSource {
    // 셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getTempArrCount()
    }
    
    // 셀 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardDetailCustomCell
        
        for i in cell.subviews {
            i.removeFromSuperview()
        }
        
        if viewModel.tempArr[indexPath.row] == 0 {
            CustomImage(parent: cell)
                .makeConstraints {
                    $0.top.equalTo(0)
                    $0.centerX.equalTo(cell)
                    $0.width.height.equalTo(50)
                }
                .setImage(image: UIImage(named: "catimage")!)
                .setRadius(size: 25)
            
            CustomLabel(parent: cell)
                .makeConstraints {
                    $0.top.equalTo(58)
                    $0.centerX.equalTo(cell)
                    $0.height.equalTo(12)
                }
                .setText(text: "닉네임할거없다고")
                .setFont(name: "NotoSansKR-Regular", size: 10)
                .setColor(color: .black)
            return cell
        }
        else if viewModel.tempArr[indexPath.row] == 1 {
            CustomButton(parent: cell)
                .makeConstraints {
                    $0.top.equalTo(0)
                    $0.centerX.equalTo(cell)
                    $0.width.height.equalTo(50)
                }
                .setColor(color: UIColor.init(hex: "EEEEEE").cgColor)
                .setRounded(size: 25)
            
            CustomLabel(parent: cell)
                .makeConstraints {
                    $0.top.equalTo(58)
                    $0.centerX.equalTo(cell)
                    $0.height.equalTo(12)
                }
                .setText(text: "더보기")
                .setFont(name: "NotoSansKR-Regular", size: 10)
                .setColor(color: .black)
            return cell
        }
        
        fatalError("error")
    }
}

extension CardDetailViewController: UICollectionViewDelegate {
    // content click
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //    detailView()
    }
}

extension CardDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // code
        CGSize(width: 74, height: 70)
        }
}
