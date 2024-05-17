//
//  PlansApp.swift
//  Plans
//
//  Created by Mehmet ALAN on 17.05.2024.
//

import FirebaseCore
import SwiftUI

@main
struct PlansApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
