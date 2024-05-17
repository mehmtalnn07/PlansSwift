//
//  User.swift
//  Plans
//
//  Created by Mehmet ALAN on 17.05.2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
