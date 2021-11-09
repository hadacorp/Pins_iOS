//
//  PinMakeViewController.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/07.
//

import UIKit

class PinMakeViewController: UIViewController {
    @IBOutlet weak var meetingBtn: UIButton!
    @IBOutlet weak var storyBtn: UIButton!
    @IBOutlet weak var communityBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBAction func backBtn(_ sender: Any) {
        (self.navigationController?.viewControllers.first as? ViewController)?.paramLatitude = MeetingPin.shared.latitude
        (self.navigationController?.viewControllers.first as? ViewController)?.paramLongitude = MeetingPin.shared.longitude
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func meetingBtn(_ sender: Any) {
        let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "MeetingDetailVC") as! MeetingDetailVC
        self.navigationController!.pushViewController(VC1, animated: false)
    }
    
    @IBAction func communityBtn(_ sender: Any) {
        let VC = self.storyboard!.instantiateViewController(withIdentifier: "CommunityDetailVC") as! CommunityDetailVC
        self.navigationController!.pushViewController(VC, animated: false)
    }
    
    @IBAction func storyBtn(_ sender: Any) {
        let VC = self.storyboard!.instantiateViewController(withIdentifier: "StoryDetailVC") as! StoryDetailVC
        self.navigationController!.pushViewController(VC, animated: false)
    }
    override func viewDidLoad() {
        // 스크롤 방지
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        setUI()
    }
    
    private func setUI(){
        meetingBtn.layer.masksToBounds = true
        meetingBtn.layer.cornerRadius = 16
        storyBtn.layer.masksToBounds = true
        storyBtn.layer.cornerRadius = 16
        communityBtn.layer.masksToBounds = true
        communityBtn.layer.cornerRadius = 16
        
        createTriangle()
    }
    
    public func createTriangle(){
        let blueTri = UIImageView(image: UIImage(named: "iconTriangleBlue"))
        let whiteTri = UIImageView(image: UIImage(named: "iconTriangleWhite"))
        
        self.view.addSubview(blueTri)
        self.view.addSubview(whiteTri)
        
        blueTri.snp.makeConstraints { make in
            make.width.equalTo(4)
            make.height.equalTo(6)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(66)
            make.leading.equalTo(UIScreen.main.bounds.width / 3 - 2)
        }
        
        whiteTri.snp.makeConstraints { make in
            make.width.equalTo(4)
            make.height.equalTo(6)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(66)
            make.trailing.equalTo(-UIScreen.main.bounds.width / 3 + 2)
        }
    }
}
