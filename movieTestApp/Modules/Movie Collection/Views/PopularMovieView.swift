//
//  PopularMovieView.swift
//  movieTestApp
//
//  Created by Temitope on 11/12/2023.
//

import UIKit

final class PopularMovieView: UIView {
    
    var onPullToRefresh: (() -> Void)?
    
    private let loading: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.font = .boldSystemFont(ofSize: 16)
        label.text = StringConstants.loading.rawValue
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var activityView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .large
        view.addSubview(loading)
        
        NSLayoutConstraint.activate([
            loading.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loading.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40)
        ])
        
        view.startAnimating()
        return view
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let view = UIRefreshControl()
        view.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.id)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentInset = .init(top: 15, left: 15, bottom: 15, right: 15)
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCollectionSources(datasource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {
        collectionView.dataSource = datasource
        collectionView.delegate = delegate
    }
    
    func reloadView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.activityView.stopAnimating()
            self.refreshControl.endRefreshing()
            self.collectionView.reloadData()
        }
    }
    
    @objc private func didPullToRefresh() {
        onPullToRefresh?()
    }
    
    private func setupViews() {
        addSubview(collectionView)
        
        collectionView.backgroundView = activityView
        activityView.center = collectionView.center
        self.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}
