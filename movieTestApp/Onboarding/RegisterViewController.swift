import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpAction(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let repository = MovieRepository(
            offlineMoiveService: OfflineMovieAPI(database: DBManager (context: context)),
            onlineMovieService: OnlineMovieService(requestable: NetworkManager.shared)
        )
        let popularVC =  PopularMovieViewController(viewModel: PopularMovieViewModel(service: repository))
        navigationController?.pushViewController(popularVC, animated: true)
    }
    

}
