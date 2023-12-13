//
//  Extensions.swift
//  movieTestApp
//
//  Created by Goonja on 12/12/23.
//

import UIKit

extension UILabel {
    static func create(text: String? = nil, textColor: UIColor? = nil, font: UIFont , textAlignment: NSTextAlignment = .left, numberOfLines: Int = 0, clabel: ((UILabel) -> (Void))? = nil) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        clabel?(label)
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}


extension UIStackView {
    static func create(spacing: CGFloat = 0, axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment, distribution:  UIStackView.Distribution, views: [UIView], stackview: ((UIStackView) -> (Void))? = nil) -> UIStackView {
        let stackView = UIStackView()
        stackView.spacing = spacing
        stackView.axis = axis
        stackView.alignment = alignment
        stackView.distribution = distribution
        views.forEach{stackView.addArrangedSubview($0)}
        stackview?(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
}
