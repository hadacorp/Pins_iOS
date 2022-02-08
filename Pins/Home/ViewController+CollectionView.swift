//
//  ViewController+CollectionView.swift
//  Pins
//
//  Created by judongseok on 2022/02/08.
//

import UIKit

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.white
        
        cell.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.16).cgColor
        cell.layer.shadowOpacity = 1
        cell.layer.shadowRadius = 4
        cell.layer.shadowOffset = CGSize(width: 0, height: 4)
//        cell.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        
        cell.layer.cornerRadius = 25
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
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
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // code
        CGSize(width: UIScreenSize.shared.width - 32, height: 170)
        }
}
