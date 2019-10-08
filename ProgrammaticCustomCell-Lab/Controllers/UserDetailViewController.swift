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
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
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
        
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        
        locationLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        locationLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        
        dobLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 20).isActive = true
        dobLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        dobLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        dobLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor).isActive = true
        
    }

    private func loadInfoLabels() {
        guard let user = user else {return}
        nameLabel.text = user.getFullNameUppercased()
        emailLabel.text = user.email
        locationLabel.text = user.getFullAddress()
        dobLabel.text = user.getDate()
    }
    private func loadPic() {
        guard let user = user else {return}
        ImageHelper.shared.fetchImage(urlString: user.picture.large) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let image):
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubViewAndConstraints()
        loadInfoLabels()
        loadPic()
    }

}
