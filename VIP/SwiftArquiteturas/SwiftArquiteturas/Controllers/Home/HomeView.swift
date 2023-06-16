//
//  HomeView.swift
//  SwiftArquiteturas
//
//  Created by Enrico Sousa Gollner on 11/06/23.
//

import UIKit

class HomeView: UIView {
    
    lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Bem vindo a Home, você conseguiu!"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17)
        
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(helloLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            helloLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
}
