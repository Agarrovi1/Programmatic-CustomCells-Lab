//
//  UserAPIHelper.swift
//  ProgrammaticCustomCell-Lab
//
//  Created by Angela Garrovillas on 10/8/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
class UserAPIHelper {
    private init() {}
    static let manager = UserAPIHelper()
    func getUsers(completionHandler: @escaping (Result<[User],AppError>) ->()) {
        let userUrl = "https://randomuser.me/api/?results=50"
        guard let url = URL(string: userUrl) else {
            completionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (resultFromNetwork) in
            switch resultFromNetwork {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let userWrap = try JSONDecoder().decode(UserWrapper.self, from: data)
                    completionHandler(.success(userWrap.results))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}
