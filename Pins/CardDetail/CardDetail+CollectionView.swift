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
        return 8 + 1
    }
    
    // 셀 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardDetailCustomCell
        if indexPath.item == 8 {
            cell.setLastItem()
            return cell
        }
        return cell
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
