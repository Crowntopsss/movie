//
//  SignInViewController.swift
//  movieTestApp
//
//  Created by Temitope on 08/12/2023.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signInAction(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let repository = MovieRepository(
            offlineMoiveService: OfflineMovieAPI(database: DBManager (context: context)),
            onlineMovieService: OnlineMovieService(requestable: NetworkManager.shared)
        )
        let popularVC =  PopularMovieViewController(viewModel: PopularMovieViewModel(service: repository))
        navigationController?.pushViewController(popularVC, animated: true)
    }

}
