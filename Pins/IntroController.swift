import UIKit

@available(iOS 13.0, *)
class IntroController: UIViewController {

    @IBOutlet weak var firstLoginButton: UIButton!
    @IBOutlet weak var exsitingLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loginButtonStyle()
    }
    
    // MARK: - View Style
    func loginButtonStyle(){
        firstLoginButton.layer.cornerRadius = 10
        exsitingLoginButton.layer.cornerRadius = 10
    }
    
    
    // MARK: - Button Listenr
    @IBAction func firstLoginButtonListener(_ sender: Any) {
        let vcLogin = self.storyboard?.instantiateViewController(identifier: "vcLogin")
        vcLogin?.modalPresentationStyle = .fullScreen
        present(vcLogin!, animated: true, completion: nil)
    }
}

