//
//  BaseViewController.swift
//  Pins
//
//  Created by judongseok on 2022/01/13.
//

// UIViewCtroller를 상속받기 떄문에 UIKit은 필수입니다.
import UIKit
// 추가로 자주 사용하는 프레임워크 추가해주시면 되요
import SnapKit

// BaseViewController는 UIViewController를 상속받습니다.
class BaseViewController: UIViewController {
    
    // 자주 사용하는 프로퍼티를 넣어줘도 되요
    // MARK: - Property
    public let safetyArea: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    // MARK: - Initializing
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setBaseView()
        setupUI()
    }
    
    func setBaseView() {
        safetyArea.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(safetyArea)
        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
            safetyArea.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
            safetyArea.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
            safetyArea.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
            safetyArea.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
            
        } else {
            safetyArea.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor).isActive = true
            safetyArea.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor).isActive = true
            safetyArea.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            safetyArea.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        }
    }
    /// UI 생성 관련
    func setupUI() {
        // override point
    }
}
