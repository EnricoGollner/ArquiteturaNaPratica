//
//  HomeView.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 15/06/23.
//

import UIKit

class HomeView: UIView {
    //MARK: - Closures
    
    //MARK: - Properties
    lazy var labelWelcome: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bem vindo ao App Login VIP"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .viewBackgroundColor
        
        setUpVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints
    private func setUpVisualElements() {
        setUpLabelWelcome()
    }
    
    private func setUpLabelWelcome() {
        self.addSubview(labelWelcome)
        
        NSLayoutConstraint.activate([
            labelWelcome.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            labelWelcome.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
        ])
    }
    
    //MARK: - Actions
}
