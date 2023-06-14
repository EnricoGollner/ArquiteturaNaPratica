//
//  HomeViewController.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 11/06/23.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    lazy var homeView: HomeView = {
        let view = HomeView(frame: .zero)
        
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray
    }
    
}
