//
//  DetailViewController.swift
//  ProgrammaticUserCells
//
//  Created by Alexander George Legaspi on 10/9/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var user: User!
    
    //MARK: - VIEWS
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "\(user.name.first) \(user.name.last)"
        return label
    }()
    
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(dismissButtonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: - LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupDismissButton()
        setupNameLabel()
    }
    
    //MARK: - OBJC FUNCTIONS
    @objc func dismissButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - CONSTRAINTS
    private func setupDismissButton() {
        self.view.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            dismissButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            dismissButton.heightAnchor.constraint(equalToConstant: 50),
            dismissButton.widthAnchor.constraint(equalToConstant: 100)
            
        ])
    }
    
    private func setupNameLabel() {
        self.view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 50),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

}
