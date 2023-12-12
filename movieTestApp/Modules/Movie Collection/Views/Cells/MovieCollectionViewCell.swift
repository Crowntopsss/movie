//
//  MovieCollectionViewCell.swift
//  movieTestApp
//
//  Created by Temitope on 12/12/2023.
//

import UIKit

final class MovieCollectionViewCell: UICollectionViewCell {
    static let id = "\(MovieCollectionViewCell.self)"
    
    private let cellImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 7
        view.layer.masksToBounds = true
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.font = .boldSystemFont(ofSize: 12)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let overView: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.font = .systemFont(ofSize: 10)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.addArrangedSubview(cellImage)
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(overView)
        stack.alignment = .fill
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var starIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage()
        image.tintColor = .yellow
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 40).isActive = true
        image.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        title.text = nil
        overView.text = nil
        starIcon.image = UIImage()
        cellImage.image = UIImage()
    }
    
    private func setupView() {
        contentView.addSubview(vStack)
        contentView.addSubview(starIcon)
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            vStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            vStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            vStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            starIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            starIcon.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
        ])
    }
    
    func setUpCell(data: Movie) {
        title.text = data.title
        overView.text = data.overview
        ImageCacheManager.fetchImageData(from: "\(URLConstants.posterPath.rawValue)\(data.backdropPath ?? "")") { (data) -> (Void) in
            DispatchQueue.main.async {
                self.cellImage.image = UIImage(data: data as Data)
            }
        }
        
        if let voteAverage = data.voteAverage, voteAverage > 8.0 {
            starIcon.image = UIImage(systemName: "star.fill")
        } else {
            starIcon.image = UIImage()
        }
    }
}
