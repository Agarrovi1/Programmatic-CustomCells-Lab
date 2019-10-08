//
//  User.swift
//  ProgrammaticCustomCell-Lab
//
//  Created by Angela Garrovillas on 10/8/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
struct UserWrapper: Codable {
    let results: [User]
}

struct User: Codable {
    let name: UserName
    let email: String
    let location: Location
    let dob: DOB
    let phone: String
    let picture: Picture
    
    func getFullName() -> String {
        return name.first + " " + name.last
    }
    func getFullNameUppercased() -> String {
        return name.first.firstUppercased + " " + name.last.firstUppercased
    }
    func getFullAddress() -> String {
        return "\(location.street) \(location.city), \(location.state)"
    }
    
}

struct UserName: Codable {
    let title: String
    let first: String
    let last: String
}

struct Picture: Codable {
    let large: String
    let thumbnail: String
}

struct Location: Codable {
    let street: String
    let city: String
    let state: String
}

struct DOB: Codable {
    let date: String
}

extension StringProtocol {
    var firstUppercased: String {
        return prefix(1).uppercased()  + dropFirst()
    }
    var firstCapitalized: String {
        return prefix(1).capitalized + dropFirst()
    }
}
