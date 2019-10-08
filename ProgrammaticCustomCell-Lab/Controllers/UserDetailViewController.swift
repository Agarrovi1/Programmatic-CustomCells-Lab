//
//  UserDetailViewController.swift
//  ProgrammaticCustomCell-Lab
//
//  Created by Angela Garrovillas on 10/8/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    //MARK: - Properties
    var user: User?
    
    lazy var nameLabel: UILabel = {
        return makeLabel()
    }()
    lazy var emailLabel: UILabel = {
        return makeLabel()
    }()
    lazy var locationLabel: UILabel = {
        return makeLabel()
    }()
    lazy var dobLabel: UILabel = {
        return makeLabel()
    }()
    
    lazy var imageView: UIImageView = {
        var picture = UIImageView()
        picture.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        picture.translatesAutoresizingMaskIntoConstraints = false
        return picture
    }()
    
    //MARK: - Functions
    private func makeLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func addSubViewAndConstraints() {
        self.view.addSubview(nameLabel)
        self.view.addSubview(emailLabel)
        self.view.addSubview(locationLabel)
        self.view.addSubview(dobLabel)
        self.view.addSubview(imageView)
        
        setConstraints()
    }
    
    private func setConstraints() {
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -50).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubViewAndConstraints()
    }

}
