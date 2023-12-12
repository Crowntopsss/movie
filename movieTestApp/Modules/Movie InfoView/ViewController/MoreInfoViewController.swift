//
//  MoreInfoViewController.swift
//  movieTestApp
//
//  Created by Temitope on 12/12/2023.
//

import UIKit

final class MoreInfoViewController: GenericViewController<MovieInfoView, MovieInfoViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.movie.title
        updateView(data: viewModel.movie)
        tapction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func updateView(data: Movie) {
        mainView.downloadImage(data: data)
    }
    
    private func tapction() {
        mainView.backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
    @objc private func backAction() {
        navigationController?.popViewController(animated: false)
    }
    
}
