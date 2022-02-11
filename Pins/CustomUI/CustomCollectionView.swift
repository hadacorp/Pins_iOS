//
//  CustomCollectionView.swift
//  Pins
//
//  Created by judongseok on 2022/02/08.
//

import UIKit
import SnapKit

class CustomCollectionView: UICollectionView {
    let flowLayout = UICollectionViewFlowLayout()
    init(frame: CGRect) {
        super.init(frame: frame, collectionViewLayout: flowLayout)
    }

    convenience init(parent: UIView) {
        self.init(frame: CGRect.zero)

        parent.addSubview(self)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)!
    }

    @discardableResult public func setBackgroundColor(color: UIColor) -> CustomCollectionView {
        self.backgroundColor = color

        return self
    }

    @discardableResult public func makeConstraints(_ maker: @escaping (ConstraintMaker) -> Void) -> CustomCollectionView {
        self.snp.makeConstraints { maker($0) }
        return self
    }
    
    @discardableResult public func setDataSource(view: Any) -> CustomCollectionView {
        self.dataSource = view as? UICollectionViewDataSource
        return self
    }
    
    @discardableResult public func setDelegate(view: Any) -> CustomCollectionView {
        self.delegate = view as? UICollectionViewDelegate
        return self
    }
    
    @discardableResult public func setRegister() -> CustomCollectionView {
        self.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return self
    }
    
    @discardableResult public func setScrollDirection(direction: ScrollDirection) -> CustomCollectionView {
        flowLayout.scrollDirection = direction
        return self
    }
    
    @discardableResult public func setSectionInset(insets: UIEdgeInsets) -> CustomCollectionView {
        flowLayout.sectionInset = insets
        return self
    }
    
    @discardableResult public func setLineSpacing(size: CGFloat) -> CustomCollectionView {
        flowLayout.minimumLineSpacing = 7
        return self
    }
    
    @discardableResult public func setScrollIndicate(show: Bool) -> CustomCollectionView {
        self.showsHorizontalScrollIndicator = show
        self.showsVerticalScrollIndicator = show
        self.decelerationRate = .fast
        return self
    }
}
