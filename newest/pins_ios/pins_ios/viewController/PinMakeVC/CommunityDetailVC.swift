//
//  CommunityDetailVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/14.
//

import UIKit

class CommunityDetailVC: UIViewController {
    // MARK:- IBAction func
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    // MARK:- Private variable
    private var scrollView: UIScrollView!
    
    // MARK:- Public variable
    public var viewModel: CommunityDetailViewModel!
    
    // MARK:- Life cycle
    override func viewDidLoad() {
        // 스크롤 방지
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        setScrollView()
        
        viewModel = CommunityDetailViewModel(parent: scrollView, view: self.view)
        viewModel.setUI()
    }
    
    // MARK:- Private func
    private func setScrollView(){
        scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(132)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-49)
        }
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1018)
    }
}

extension CommunityDetailVC: UIScrollViewDelegate{
    
}
