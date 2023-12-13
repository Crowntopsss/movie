import UIKit

class OnboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Storyboard", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "RegisterViewController")
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Storyboard", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "SignInViewController")
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
