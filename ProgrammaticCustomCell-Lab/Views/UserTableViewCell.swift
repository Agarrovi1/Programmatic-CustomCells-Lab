//
//  UserTableViewCell.swift
//  ProgrammaticCustomCell-Lab
//
//  Created by Angela Garrovillas on 10/8/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    var nameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var picImageView: UIImageView = {
        var picture = UIImageView()
        picture.translatesAutoresizingMaskIntoConstraints = false
        return picture
    }()
    
    private func addToSubView() {
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(picImageView)
        setConstraints()
    }
    private func setConstraints() {
        picImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 30).isActive = true
        picImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -30).isActive = true
        picImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 30).isActive = true
        picImageView.trailingAnchor.constraint(equalTo: self.contentView.centerXAnchor,constant: -30).isActive = true
        
        nameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
        
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "userCell")
        addToSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
