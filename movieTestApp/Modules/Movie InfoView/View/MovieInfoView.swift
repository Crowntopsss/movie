//
//  MovieInfoView.swift
//  movieTestApp
//
//  Created by Temitope on 12/12/2023.
//

import UIKit

final class MovieInfoView: UIView {
        
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let backGroundImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let mainImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 7
        view.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 200),
            view.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let title = UILabel.create(text: nil, textColor: .darkText, font: .boldSystemFont(ofSize: 20), textAlignment: .left, numberOfLines: 1, clabel: nil)
    
    private let popularLabel =  UILabel.create(text: "POPULAR", textColor: .darkGray, font: .systemFont(ofSize: 12), textAlignment: .center, numberOfLines: 1) { UILabel in
        UILabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        UILabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        UILabel.layer.cornerRadius = 7
        UILabel.backgroundColor = .lightText
        UILabel.layer.masksToBounds = true
    }
    
    private let adultLabel =  UILabel.create(text: "+18", textColor: .darkGray, font: .systemFont(ofSize: 12), textAlignment: .center, numberOfLines: 1) { UILabel in
        UILabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        UILabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        UILabel.layer.cornerRadius = 7
        UILabel.backgroundColor = .lightText
        UILabel.layer.masksToBounds = true
    }
    
    private lazy var movieInfoStack = UIStackView.create(spacing: 20, axis: .horizontal, alignment: .fill, distribution: .fill, views: [popularLabel, adultLabel, UIView()], stackview: nil)
    
    // over View text
    
    private let overViewText = UILabel.create(text: nil, textColor: .lightGray, font: .systemFont(ofSize: 14), textAlignment: .left, numberOfLines: 0, clabel: nil)
    
    // Rating Views
    
    private let voteAverageCount = UILabel.create(text: nil, textColor: .black, font: .boldSystemFont(ofSize: 16), textAlignment: .center, numberOfLines: 1, clabel: nil)
    
    private let voteAverageLabel = UILabel.create(text: "Vote average", textColor: .black, font: .systemFont(ofSize: 16), textAlignment: .center, numberOfLines: 1, clabel: nil)
    
    private lazy var voteVStack = UIStackView.create(spacing: 5, axis: .vertical, alignment: .fill, distribution: .fill, views: [voteAverageCount, voteAverageLabel], stackview: nil)
    
    private lazy var voteView: UIView = {
        let view = UIView()
        view.addSubview(voteVStack)
        view.layer.cornerRadius = 7
        NSLayoutConstraint.activate([
            voteVStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            voteVStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        view.backgroundColor = .systemGray5
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let voteCountlabel = UILabel.create(text: nil, textColor: .black, font: .boldSystemFont(ofSize: 16), textAlignment: .center, numberOfLines: 1, clabel: nil)
    
    private let voteCountLabel = UILabel.create(text: "Vote count", textColor: .black, font: .systemFont(ofSize: 16), textAlignment: .center, numberOfLines: 1, clabel: nil)
    
    private lazy var voteCountVStack = UIStackView.create(spacing: 5, axis: .vertical, alignment: .fill, distribution: .fill, views: [voteCountlabel, voteCountLabel], stackview: nil)
    
    private lazy var voteCountView: UIView = {
        let view = UIView()
        view.addSubview(voteCountVStack)
        view.layer.cornerRadius = 7
        NSLayoutConstraint.activate([
            voteCountVStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            voteCountVStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        view.backgroundColor = .systemGray5
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var voteHStack = UIStackView.create(spacing: 40, axis: .horizontal, alignment: .fill, distribution: .fillEqually, views: [voteView, voteCountView], stackview: nil)
    
    lazy var backButton : UIButton = {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 7
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    // View movie info stack view
    private lazy var viewHStack = UIStackView.create(spacing: 10, axis: .vertical, alignment: .fill, distribution: .fill, views: [movieInfoStack, title, voteHStack, overViewText, backButton], stackview: nil)
    

    private func setupView() {
        self.addSubview(backGroundImage)
        self.addSubview(mainImage)
        self.addSubview(viewHStack)
        
        self.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            backGroundImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            backGroundImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            backGroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backGroundImage.heightAnchor.constraint(equalToConstant: 500),
            
            mainImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            
            viewHStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            viewHStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            viewHStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
        
    }
    
    func downloadImage(data: Movie) {
        ImageCacheManager.fetchImageData(from: "\(URLConstants.posterPath.rawValue)\(data.backdropPath ?? "")") { (data) -> (Void) in
            DispatchQueue.main.async { [weak self] in
                self?.backGroundImage.image = UIImage(data: data as Data)
                self?.addGradient()
            }
        }
        
        ImageCacheManager.fetchImageData(from: "\(URLConstants.posterPath.rawValue)\(data.posterPath ?? "")") { (data) -> (Void) in
            DispatchQueue.main.async { [weak self] in
                self?.mainImage.image = UIImage(data: data as Data)
            }
        }
        
        title.text = data.title
        overViewText.text = data.overview
        voteCountlabel.text = "\(data.voteCount ?? 0)"
        voteAverageCount.text = "\(data.voteAverage ?? 0.0)/10.0"
        adultLabel.isHidden = data.adult ?? false
    }
    
    private func addGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = backGroundImage.bounds
        let startColor = UIColor(red: 30/255, green: 113/255, blue: 79/255, alpha: 0).cgColor
        let endColor = UIColor.white.cgColor
        gradient.colors = [startColor, endColor]
        backGroundImage.layer.insertSublayer(gradient, at: 0)
    }
    
}

