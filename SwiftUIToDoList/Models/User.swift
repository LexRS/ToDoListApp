//
//  User.swift
//  SwiftUIToDoList
//
//  Created by Алексей Поддубный on 22.05.2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
