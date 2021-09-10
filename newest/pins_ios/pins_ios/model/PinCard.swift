//
//  PinCard.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/10.
//

import UIKit

class PinCard {
    enum PinType{
        case meet
        case community
        case storyWithImage
        case storyWithoutImage
        
        func discription() -> String {
            switch self {
            case .meet:
                return "만남"
            case .community:
                return "커뮤니티"
            case .storyWithImage:
                return "이야기"
            case .storyWithoutImage:
                return "이야기"
            }
        }
    }
    
    func initBottom(parent: UIView, type: PinType, string: String?, like: Int?, comment: Int?) {
        switch type {
        case .meet, .community:
            let label = UILabel()
            parent.addSubview(label)
            label.snp.makeConstraints { view in
                view.leading.equalTo(12)
                view.bottom.equalTo(-8)
            }
            label.text = string
            label.font = UIFont(name: "NotoSansKR-Regular", size: 13)
            label.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        case .storyWithoutImage, .storyWithImage:
            if let like = like {
                let image = UIImageView.init(image: #imageLiteral(resourceName: "iconLike"))
                let count = UILabel()
                count.text = "\(like)"
                count.font = UIFont(name: "NotoSansKR-Regular", size: 13)
                count.textColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
                parent.addSubview(image)
                parent.addSubview(count)
                
                image.snp.makeConstraints { img in
                    img.width.height.equalTo(16)
                    img.leading.equalTo(12)
                    img.bottom.equalTo(-8)
                }
                count.snp.makeConstraints { ct in
                    ct.leading.equalTo(32)
                    ct.bottom.equalTo(-8)
                }
            }
            
            if let comment = comment {
                let image = UIImageView.init(image: #imageLiteral(resourceName: "iconLike"))
                let count = UILabel()
                count.text = "\(comment)"
                count.font = UIFont(name: "NotoSansKR-Regular", size: 13)
                count.textColor = #colorLiteral(red: 0.3764705882, green: 0.3764705882, blue: 0.3764705882, alpha: 1)
                parent.addSubview(image)
                parent.addSubview(count)
                
                image.snp.makeConstraints { img in
                    img.width.height.equalTo(16)
                    if like == nil {
                        img.leading.equalTo(12)
                    } else {
                        img.leading.equalTo(60)
                    }
                    img.bottom.equalTo(-8)
                }
                count.snp.makeConstraints { ct in
                    if like == nil {
                        ct.leading.equalTo(32)
                    } else {
                        ct.leading.equalTo(80)
                    }
                    ct.bottom.equalTo(-8)
                }
            }
        }
    }
    
    func initContent(parent: UIView, type: PinType, string: String) {
        let content = UILabel()
        parent.addSubview(content)
        switch type {
        case .meet, .community, .storyWithImage:
            content.snp.makeConstraints { label in
                label.top.equalTo(32)
                label.leading.equalTo(12)
                label.trailing.equalTo(-110)
            }
            content.text = string
            content.numberOfLines = 2
            content.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        case .storyWithoutImage:
            content.snp.makeConstraints { label in
                label.top.equalTo(32)
                label.leading.equalTo(12)
                label.trailing.equalTo(-12)
            }
            content.text = string
            content.numberOfLines = 2
            content.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        }
    }
    
    func initImage(parent: UIView, type: PinType, image: UIImage?) {
        let imageView = UIImageView()
        parent.addSubview(imageView)
        switch type {
        case .community, .storyWithImage:
            imageView.snp.makeConstraints { imgview in
                imgview.trailing.equalTo(0)
                imgview.top.equalTo(0)
                imgview.width.height.equalTo(110)
            }
            let maskView = UIImageView(image: UIImage(named: "cardMask"))
            imageView.image = image
            imageView.contentMode = .scaleAspectFill
            imageView.mask = maskView
        case .meet:
            imageView.snp.makeConstraints { imgview in
                imgview.width.height.equalTo(94)
                imgview.top.equalTo(8)
                imgview.trailing.equalTo(-8)
            }
            let maskView = UIImageView(image: UIImage(named: "profileMask"))
            imageView.image = image
            imageView.contentMode = .scaleAspectFill
            imageView.mask = maskView
        default:
            print("default Error")
        }
    }
    
    func initTag(parent: UIView, type: PinType){
        let tag = UIButton()
        parent.addSubview(tag)
        tag.setTitle(type.discription(), for: .normal)
        tag.snp.makeConstraints { btn in
            btn.height.equalTo(17)
            btn.top.equalTo(11)
            btn.leading.equalTo(12)
            btn.width.equalTo(tag.titleLabel!.text!.count * 11 + 25)
        }
        tag.titleEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 1, right: 12)
        tag.layer.cornerRadius = 8.5
        tag.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        tag.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 12)
    }
    
    func initCategory(parent: UIView, string: String, type: PinType){
        let tag = UIButton()
        parent.addSubview(tag)
        tag.setTitle(string, for: .normal)
        tag.snp.makeConstraints { btn in
            btn.height.equalTo(17)
            btn.top.equalTo(11)
            btn.leading.equalTo(type.discription().count * 24 + 16)
            btn.width.equalTo(tag.titleLabel!.text!.count * 11 + 25)
        }
        tag.titleEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 1, right: 12)
        tag.layer.cornerRadius = 8.5
        tag.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        tag.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        tag.titleLabel?.numberOfLines = 0
        tag.sizeToFit()
    }
    
    func maskImage(image:UIImage, mask:(UIImage))-> UIImage {
        let imageReference = image.cgImage
        let maskReference = mask.cgImage
        let imageMask = CGImage(maskWidth: maskReference!.width, height: maskReference!.height, bitsPerComponent: maskReference!.bitsPerComponent, bitsPerPixel: maskReference!.bitsPerPixel, bytesPerRow: maskReference!.bytesPerRow, provider: maskReference!.dataProvider!, decode: nil, shouldInterpolate: true)
        let maskedReference = imageReference!.masking(imageMask!)
        let maskedImage = UIImage(cgImage:maskedReference!)
        return maskedImage
    }
}
