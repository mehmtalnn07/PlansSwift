//
//  PlansListItem.swift
//  Plans
//
//  Created by Mehmet ALAN on 17.05.2024.
//

import Foundation

struct PlansListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
