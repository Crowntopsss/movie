//
//  PopularMovieView.swift
//  movieTestApp
//
//  Created by Temitope on 11/12/2023.
//

import UIKit

final class PopularMovieViewController:  GenericViewController<PopularMovieView, PopularMovieViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = StringConstants.popularMovies.text
        bindViewModel()
        setupRefreshAction()
        mainView.setCollectionSources(datasource: self,
                                      delegate: self)
        viewModel.getMovies()
    }
    
    private func bindViewModel() {
        viewModel.state = {[weak self] state in
            DispatchQueue.main.async {
                switch state {
                case .success:
                    self?.mainView.reloadView()
                case .error:
                    self?.showAlert(data: nil)
                }
            }
        }
    }
    
    private func setupRefreshAction() {
        mainView.onPullToRefresh = {[weak self] in
            self?.viewModel.getMovies()
        }
    }
    
    private func showAlert(data: Movie?) {
        let alert = UIAlertController(
            title: data == nil ? StringConstants.error.text : data?.title,
            message: data == nil ? StringConstants.postGenericError.text : StringConstants.continueText.text + " '\(data?.title ?? "")'",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(
            title: data == nil ? StringConstants.tryAgain.text : StringConstants.continueLabel.text,
            style: .default,
            handler: {[weak self] _ in
                data == nil ? self?.viewModel.getMovies() : self?.goToMovieInfoView(data: data!)
            }))
        
        alert.addAction(
            UIAlertAction(
                title: StringConstants.cancel.text,
                style: .cancel,
                handler: nil
            ))
        
        present(alert, animated: true, completion: nil)
    }
    
    private func goToMovieInfoView(data: Movie) {
        let vc = MoreInfoViewController(viewModel: MovieInfoViewModel(movie: data))
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension PopularMovieViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.id, for: indexPath) as! MovieCollectionViewCell
        cell.setUpCell(data: viewModel.movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.width - 30) / 2.0
        return CGSize(width: width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == (viewModel.movies.count - 10) {
            viewModel.page += 1
            viewModel.getMovies()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = viewModel.movies[indexPath.row]
        showAlert(data: movie)
    }

    
}
