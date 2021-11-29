//
//  ProfileVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/30.
//

import UIKit

class ProfileVC: UIViewController, BaseViewController {
    //MARK: - UI Variable
    var imagePicker: UIImagePickerController!
    var paramNick = ""
    
    let proTitle1: UILabel = {
        let label = UILabel()
        label.text = "마지막으로"
        label.font = UIFont(name: "NotoSansKR-Medium", size: 20)
        label.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        return label
    }()
    let proTitle2: UILabel = {
        let label = UILabel()
        label.text = "프로필 사진을 등록해 주세요."
        label.font = UIFont(name: "NotoSansKR-Medium", size: 20)
        label.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        return label
    }()
    let proDescription: UILabel = {
        let label = UILabel()
        label.text = "프로필 사진"
        label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        label.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        return label
    }()
    let nickPlaceholder: UILabel = {
        let label = UILabel()
        label.text = "닉네임"
        label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        label.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        return label
    }()
    let nickname: UILabel = {
        let label = UILabel()
        label.text = "닉네임"
        label.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        label.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        return label
    }()
    let line: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        return view
    }()
    let picture: UIButton = {
        let btn = UIButton()
        let maskView = UIImageView(image: UIImage(named: "profileMask"))
        maskView.frame = CGRect(x: 0, y: 0, width: 140, height: 140)
        btn.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9647058824, blue: 1, alpha: 1)
        btn.mask = maskView
        btn.addTarget(self, action: #selector(clickImageBtn), for: .touchUpInside)
        return btn
    }()
    let cameraImg: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "iconCamera")
        return img
    }()
    let cameraText: UILabel = {
        let text = UILabel()
        text.text = "사진 0/1"
        text.textColor = #colorLiteral(red: 0.5450980392, green: 0.5921568627, blue: 0.6941176471, alpha: 1)
        text.font = UIFont(name: "NotoSansKR-Regular", size: 11)
        return text
    }()
}

//MARK: - Life Cycle
extension ProfileVC{
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        setUI()
    }
}

//MARK: - UI Logic
extension ProfileVC{
    func setUI() {
        setDelegate()
        addSubViews()
        setLayout()
        nickname.text! = paramNick
    }
    
    func setDelegate() {
        
    }
    
    func addSubViews() {
        view.addSubview(proTitle1)
        view.addSubview(proTitle2)
        view.addSubview(proDescription)
        view.addSubview(nickPlaceholder)
        view.addSubview(nickname)
        view.addSubview(line)
        view.addSubview(picture)
        view.addSubview(cameraImg)
        view.addSubview(cameraText)
    }
    
    func setLayout() {
        proTitle1.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(64)
        }
        proTitle2.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(104)
        }
        proDescription.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(157)
        }
        nickPlaceholder.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(341)
        }
        nickname.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(361)
        }
        line.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(394)
            make.height.equalTo(2)
        }
        picture.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(177)
            make.width.height.equalTo(140)
        }
        cameraImg.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(231)
            make.width.equalTo(20)
            make.height.equalTo(17)
        }
        cameraText.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(248)
        }
    }
    
    @objc func clickImageBtn(){
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
}
extension ProfileVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            cameraText.layer.opacity = 0
            cameraImg.layer.opacity = 0
            let thumb = UIImageView()
            thumb.image = image
            picture.addSubview(thumb)
            thumb.snp.makeConstraints { make in
                make.top.leading.trailing.bottom.equalTo(0)
            }
            thumb.contentMode = .scaleAspectFill
        }
        dismiss(animated: true, completion: nil)
    }
}
