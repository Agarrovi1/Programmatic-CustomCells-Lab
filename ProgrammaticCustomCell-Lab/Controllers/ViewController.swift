//
//  ViewController.swift
//  ProgrammaticCustomCell-Lab
//
//  Created by Angela Garrovillas on 10/8/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    var users = [User]() {
        didSet {
            userTableView.reloadData()
        }
    }
    
    lazy var userTableView: UITableView = {
        var myTableView = UITableView()
        myTableView.register(UserTableViewCell.self, forCellReuseIdentifier: "userCell")
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.delegate = self
        myTableView.dataSource = self
        return myTableView
    }()

    //MARK: - Functions
    private func addSubviews() {
        self.view.addSubview(userTableView)
        setConstraints()
    }
    private func setConstraints() {
        userTableView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 50).isActive = true
        userTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        userTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        userTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    func loadUserData() {
        UserAPIHelper.manager.getUsers { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let usersFromJSON):
                DispatchQueue.main.async {
                    self.users = usersFromJSON
                }
            }
        }
    }
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubviews()
        loadUserData()
        // Do any additional setup after loading the view.
    }
}

//MARK: - TableView Delegate, DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = userTableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserTableViewCell else {return UITableViewCell()}
        let user = users[indexPath.row]
        cell.nameLabel.text = user.getFullNameUppercased()
        
        ImageHelper.shared.fetchImage(urlString: user.picture.thumbnail) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let image):
                DispatchQueue.main.async {
                    cell.picImageView.image = image
                }
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = users[indexPath.row]
        let detailVC = UserDetailViewController()
        detailVC.user = selectedUser
        present(detailVC, animated: true, completion: nil)
    }
    
}
