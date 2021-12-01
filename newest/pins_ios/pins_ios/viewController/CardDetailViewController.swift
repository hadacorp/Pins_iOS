//
//  CardDetailViewController.swift
//  pins_ios
//
//  Created by judongseok on 2021/12/02.
//

import UIKit

class CardDetailViewController: UIViewController {
    var meetingCardDetail: MeetingCardDetail! = nil
    // 1
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    // MARK: - Variable UI
    lazy var profile: UIImageView = {
        let image = UIImageView()
        let url = URL(string: (meetingCardDetail.createUser?.image)!)
        image.load(url: url!)
        let maskView = UIImageView(image: UIImage(named: "profileMask"))
        image.mask = maskView
        return image
    }()
    
    lazy var topUI: UIView = {
        let top = UIView()
        top.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        top.layer.cornerRadius = 2
        return top
    }()
    
    lazy var profileLine: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        return line
    }()
    
    lazy var contentLine: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        return line
    }()
    
    lazy var lastLine: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        return line
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.text = meetingCardDetail.createUser?.nickName!
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        return label
    }()
    
    lazy var age: UILabel = {
        let label = UILabel()
        label.text = meetingCardDetail.createUser?.detail!
        label.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        return label
    }()
    
    lazy var star: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "star")
        return image
    }()
    
    lazy var siren: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "sirenIcon")
        return image
    }()
    
    lazy var 
    
    // 2
    let maxDimmedAlpha: CGFloat = 0.3
    lazy var dimmedView: UIView = {
        let view = UIView()
        view.alpha = 0
        view.backgroundColor = .black
        return view
    }()
    
    let defaultHeight: CGFloat = 436
    
    let dismissibleHeight: CGFloat = 200
    let maximumContainerHeight: CGFloat = UIScreen.main.bounds.height - 64
    // keep updated with new height
    var currentContainerHeight: CGFloat = 436
    
    // 3. Dynamic container constraint
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupPanGesture()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateShowDimmedView()
        animatePresentContainer()
    }
    
    func setupView() {
        view.backgroundColor = .clear
    }
    
    func animatePresentContainer() {
        // Update bottom constraint in animation block
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = 0
            // Call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
    }
    
    func animateShowDimmedView() {
        dimmedView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = self.maxDimmedAlpha
        }
    }
    
    func animateDismissView() {
        // hide main container view by updating bottom constraint in animation block
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = self.defaultHeight
            // call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
        
        // hide blur view
        dimmedView.alpha = maxDimmedAlpha
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = 0
        } completion: { _ in
            // once done, dismiss without animation
            self.dismiss(animated: false)
        }
    }
    
    func setupPanGesture() {
        // add pan gesture recognizer to the view controller's view (the whole screen)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        // change to false to immediately listen on gesture movement
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        // Drag to top will be minus value and vice versa
        // print("Pan gesture y offset: \(translation.y)")

        // Get drag direction
         let isDraggingDown = translation.y > 0
        // print("Dragging direction: \(isDraggingDown ? "going down" : "going up")")

        // New height is based on value of dragging plus current container height
        let newHeight = currentContainerHeight - translation.y

        // Handle based on gesture state
        switch gesture.state {
        case .changed:
            // This state will occur when user is dragging
            if newHeight < maximumContainerHeight {
                // Keep updating the height constraint
                containerViewHeightConstraint?.constant = newHeight
                // refresh layout
                view.layoutIfNeeded()
            }
        case .ended:
            // This happens when user stop drag,
            // so we will get the last height of container
            // Condition 1: If new height is below min, dismiss controller
            if newHeight < dismissibleHeight {
                self.animateDismissView()
            }
            else if newHeight < defaultHeight {
                // Condition 2: If new height is below default, animate back to default
                animateContainerHeight(defaultHeight)
            }
            else if newHeight < maximumContainerHeight && isDraggingDown {
                // Condition 3: If new height is below max and going down, set to default height
                animateContainerHeight(defaultHeight)
            }
            else if newHeight > defaultHeight && !isDraggingDown {
                // Condition 4: If new height is below max and going up, set to max height at top
                animateContainerHeight(maximumContainerHeight)
            }
        default:
            break
        }
    }
    
    func animateContainerHeight(_ height: CGFloat) {
        UIView.animate(withDuration: 0.4) {
            // Update container height
            self.containerViewHeightConstraint?.constant = height
            // Call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
        // Save current height
        currentContainerHeight = height
    }
    
    func setupConstraints() {
        // 4. Add subviews
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        containerView.addSubview(profile)
        containerView.addSubview(topUI)
        containerView.addSubview(profileLine)
        containerView.addSubview(contentLine)
        containerView.addSubview(lastLine)
        containerView.addSubview(name)
        containerView.addSubview(age)
        containerView.addSubview(star)
        containerView.addSubview(siren)
        
        
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // 5. Set static constraints
        NSLayoutConstraint.activate([
            // set dimmedView edges to superview
            dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // set container static constraint (trailing & leading)
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        // 6. Set container to default height
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: defaultHeight)
        // 7. Set bottom constant to 0
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: defaultHeight)

        // Activate constraints
        containerViewHeightConstraint?.isActive = true
        containerViewBottomConstraint?.isActive = true
        
        profile.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(16)
            make.width.height.equalTo(40)
        }
        topUI.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.width.equalTo(40)
            make.height.equalTo(4)
        }
        profileLine.snp.makeConstraints { make in
            make.leading.trailing.equalTo(0)
            make.top.equalTo(72)
            make.height.equalTo(1)
        }
        contentLine.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.top.equalTo(283)
            make.height.equalTo(1)
        }
        lastLine.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.top.equalTo(420)
            make.height.equalTo(1)
        }
        name.snp.makeConstraints { make in
            make.leading.equalTo(64)
            make.top.equalTo(17)
        }
        age.snp.makeConstraints { make in
            make.leading.equalTo(64)
            make.top.equalTo(36)
        }
        star.snp.makeConstraints { make in
            make.trailing.equalTo(-64)
            make.top.equalTo(16)
            make.width.height.equalTo(40)
        }
        siren.snp.makeConstraints { make in
            make.trailing.equalTo(-16)
            make.top.equalTo(16)
            make.width.height.equalTo(40)
        }
    }
}

