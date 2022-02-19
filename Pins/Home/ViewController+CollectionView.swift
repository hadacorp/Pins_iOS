//
//  ViewController+CollectionView.swift
//  Pins
//
//  Created by judongseok on 2022/02/08.
//

import UIKit

extension ViewController: UICollectionViewDataSource {
    // 셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    // 셀 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ViewControllerCustomCell
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    // 셀 드래그
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            
        if let cv = scrollView as? UICollectionView {
            let cellWidth = UIScreenSize.shared.width - (16 + 9)
            
            print(cellWidth)
            print(UIScreenSize.shared.width)
            
            var offset = targetContentOffset.pointee
            let idx = round((offset.x + cv.contentInset.left) / cellWidth)
            
            if idx > currentIdx {
                currentIdx += 1
            } else if idx < currentIdx {
                if currentIdx != 0 {
                    currentIdx -= 1
                }
            }
            
            offset = CGPoint(x: currentIdx * cellWidth - cv.contentInset.left, y: 0)
            targetContentOffset.pointee = offset
        }
    }
    
    // content click
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        detailView()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // code
        CGSize(width: UIScreenSize.shared.width - 32, height: 170)
        }
}
