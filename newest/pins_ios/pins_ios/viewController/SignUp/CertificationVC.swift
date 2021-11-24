//
//  CertificationVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/25.
//

import Foundation
import UIKit

// MARK: - ViewController Main Variable
class CertificationVC: UIViewController, BaseViewController{
    let backBtn: UIButton = {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: "btnBack"), for: .normal)
        btn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return btn
    }()
}

// MARK: - ViewController LifeCycle
extension CertificationVC{
    override func viewDidLoad() {
        setUI()
    }
}

// MARK: - ViewController Setting UI
extension CertificationVC{
    func setUI() {
        setDelegate()
        addSubViews()
        setLayout()
    }
    
    func setDelegate() {
        
    }
    
    func addSubViews() {
        view.addSubview(backBtn)
    }
    
    func setLayout() {
        backBtn.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.width.height.equalTo(48)
        }
    }
}

// MARK: - ViewController Event Function
extension CertificationVC{
    @objc
    func backAction(){
        self.navigationController?.popViewController(animated: true)
    }
}
