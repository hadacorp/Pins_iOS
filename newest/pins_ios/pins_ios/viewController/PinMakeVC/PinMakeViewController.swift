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
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        setUI()
    }
    
    private func setUI(){
        meetingBtn.layer.masksToBounds = true
        meetingBtn.layer.cornerRadius = 16
        storyBtn.layer.masksToBounds = true
        storyBtn.layer.cornerRadius = 16
        communityBtn.layer.masksToBounds = true
        communityBtn.layer.cornerRadius = 16
    }
}
