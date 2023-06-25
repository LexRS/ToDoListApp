//
//  SwiftUIToDoListApp.swift
//  SwiftUIToDoList
//
//  Created by Алексей Поддубный on 18.05.2023.
//

import SwiftUI
import FirebaseCore

@main
struct SwiftUIToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
