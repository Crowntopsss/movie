//
//  GenericViewContoller.swift
//  movieTestApp
//
//  Created by Goonja on 12/12/23.
//

import Foundation
import UIKit

class GenericViewController<subview: UIView, viewModel: Any>: UIViewController {
    
    let mainView: subview
    let viewModel: viewModel
    
    public init(viewModel: viewModel) {
        self.viewModel = viewModel
        self.mainView = subview(frame: .zero)
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
    }

}
