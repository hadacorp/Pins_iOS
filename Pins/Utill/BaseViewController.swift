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
import MapKit
// BaseViewController는 UIViewController를 상속받습니다.
class BaseViewController: UIViewController {
    
    // 자주 사용하는 프로퍼티를 넣어줘도 되요
    // MARK: - Property
    
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
        setupUI()
    }
    
    /// UI 생성 관련
    func setupUI() { }
}
