//
//  StoryContentVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/11.
//

import UIKit
import BSImagePicker
import Photos

class StoryContentVC: UIViewController {
    @IBOutlet weak var successBtn: UIButton!
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var titleTextView: UITextView!
    
    private var selectedAssets: [PHAsset] = []
    private var userSelectedImages: [UIImage] = []
    private var scrollView = UIScrollView()
    
    override func viewDidLoad() {
        setUI()
        initScrollView()
        initImageView()
    }
    
    func setUI(){
        titleTextView.delegate = self
        contentTextView.delegate = self
        
        titleTextView.tag = 1
        contentTextView.tag = 2
        
        successBtn.setTitleColor(#colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1), for: .normal)
        titleTextView.textContainerInset = .zero
        contentTextView.textContainerInset = .zero
        
        titleTextView.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        contentTextView.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    }
    
    private func initScrollView(){
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(88)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(self.view).offset(-(UIScreen.main.bounds.height - 212))
        }
        print(UIScreen.main.bounds.height - 132)
        scrollView.contentSize = CGSize(width: 76 * userSelectedImages.count, height: 76)
    }
    
    private func initImageView(){
        let btn = UIButton()
        scrollView.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.width.height.equalTo(60)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(104)
            make.leading.equalTo(16)
        }
        
        btn.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9647058824, blue: 1, alpha: 1)
        btn.layer.cornerRadius = 8
        
        initImageViewIcon(parent: btn)
        initImageViewText(parent: btn)
        btn.addTarget(self, action: #selector(clickImageBtn), for: .touchUpInside)
    }
    private func initImageViewIcon(parent: UIView){
        let mainImg = UIImageView(image: #imageLiteral(resourceName: "iconCamera"))
        parent.addSubview(mainImg)
        mainImg.snp.makeConstraints { make in
            make.width.equalTo(20)
            make.height.equalTo(17)
            make.top.equalTo(14)
            make.centerX.equalTo(parent)
        }
    }
    private func initImageViewText(parent: UIView){
        let text = UILabel()
        parent.addSubview(text)
        text.snp.makeConstraints { make in
            make.width.equalTo(75)
            make.height.equalTo(17)
            make.top.equalTo(31)
            make.centerX.equalTo(parent)
        }
        text.textAlignment = .center
        text.text = "0/5"
        text.textColor = #colorLiteral(red: 0.5450980392, green: 0.5921568627, blue: 0.6941176471, alpha: 1)
        text.font = UIFont(name: "NotoSansKR-Regular", size: 11)
    }
    
    @objc func clickImageBtn(){
        let imagePicker = ImagePickerController()
        imagePicker.settings.selection.max = 5
        imagePicker.settings.fetch.assets.supportedMediaTypes = [.image]
        
        let vc = UIApplication.shared.windows.first!.rootViewController
        
        vc?.presentImagePicker(imagePicker, select: { (asset) in
            
            // User selected an asset. Do something with it. Perhaps begin processing/upload?
            
        }, deselect: { (asset) in
            // User deselected an asset. Cancel whatever you did when asset was selected.
            
        }, cancel: { (assets) in
            // User canceled selection.
            
        }, finish: { [self] (assets) in
            // User finished selection assets.
            for i in 0..<assets.count {
                self.selectedAssets.append(assets[i])
            }
            self.convertAssetToImages()
            
            for i in 0..<userSelectedImages.count{
                let imageView = UIImageView()
                
                scrollView.addSubview(imageView)
                imageView.image = userSelectedImages[i]
                
                imageView.snp.makeConstraints { make in
                    make.width.height.equalTo(60)
                    make.leading.equalTo(92 + (i * 76))
                    make.top.equalTo(16)
                }
                imageView.contentMode = .scaleAspectFill
                imageView.clipsToBounds = true
                imageView.layer.cornerRadius = 8
                imageView.backgroundColor = .red
            }
            
            // scrollView resetting
            scrollView.contentSize = CGSize(width: (76 * (userSelectedImages.count + 1)) + 16, height: 76)
            userSelectedImages = []
        })
    }
}
extension StoryContentVC: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1) {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.tag == 1 && textView.text.isEmpty {
            textView.text = "제목(4~30글자)"
            textView.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        }
        else if textView.tag == 2 && textView.text.isEmpty {
            textView.text = "내용을 적어주세요"
            textView.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        }
    }
}
extension StoryContentVC: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.y = 0
    }
}

extension StoryContentVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
    }
    func convertAssetToImages() {
        if selectedAssets.count != 0 {
            for i in 0..<selectedAssets.count {
                
                let imageManager = PHImageManager.default()
                let option = PHImageRequestOptions()
                option.isSynchronous = true
                var thumbnail = UIImage()
                
                imageManager.requestImage(for: selectedAssets[i],
                                             targetSize: CGSize(width: 200, height: 200),
                                             contentMode: .aspectFit,
                                             options: option) { (result, info) in
                    thumbnail = result!
                }
                
                let data = thumbnail.jpegData(compressionQuality: 0.7)
                let newImage = UIImage(data: data!)
                
                self.userSelectedImages.append(newImage! as UIImage)
            }
        }
    }
}
