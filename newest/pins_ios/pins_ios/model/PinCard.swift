//
//  PinCard.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/10.
//

import UIKit

class PinCard {
    
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
                let image = UIImageView.init(image: #imageLiteral(resourceName: "iconComment"))
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
    
    func initImage(parent: UIView, type: PinType, urlString: String?) {
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
            let url: URL?
            if let str = urlString {
                url = URL(string: str)
                let data = try! Data(contentsOf: url!)
                imageView.image = UIImage(data: data)
                imageView.contentMode = .scaleAspectFill
                imageView.mask = maskView
            }
        case .meet:
            imageView.snp.makeConstraints { imgview in
                imgview.width.height.equalTo(94)
                imgview.top.equalTo(8)
                imgview.trailing.equalTo(-8)
            }
            let maskView = UIImageView(image: UIImage(named: "profileMask"))
            let url = URL(string: urlString!)
            let data = try! Data(contentsOf: url!)
            imageView.image = UIImage(data: data)
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
            btn.width.equalTo(getTagWidth(type: type))
        }
        tag.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 1, right: 0)
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
            btn.leading.equalTo(getTagWidth(type: type) + 12 + 4)
            btn.width.equalTo(getStringWidth(string: string))
        }
        tag.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 1, right: 0)
        tag.layer.cornerRadius = 8.5
        tag.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        tag.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        tag.titleLabel?.numberOfLines = 0
    }
    
    func getTagWidth(type: PinType) -> Int{
        switch type {
        case .community:
            return 68
        case .meet:
            return 46
        case .storyWithImage, .storyWithoutImage:
            return 57
        }
    }
    
    func getStringWidth(string: String) -> Int{
        var width = 0
        width = string.count * 11
        if string.contains("#") {
            width += 5
            width -= 11
        }
        if string.contains("/") {
            width += 5
            width -= 11
        }
        width += 24
        return width
    }
    
    func initial(parent: UIView, type: PinType, category: String, content: String, urlString: String?, bottom: String?, like: Int?, comment: Int?){
        initTag(parent: parent, type: type)
        initCategory(parent: parent, string: category, type: type)
        initContent(parent: parent, type: type, string: content)
        initImage(parent: parent, type: type, urlString: urlString)
        initBottom(parent: parent, type: type, string: bottom, like: like, comment: comment)
    }
}
