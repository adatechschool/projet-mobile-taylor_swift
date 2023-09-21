//
//  Mobile_projectApp.swift
//  Mobile_project
//
//  Created by kady on 30/08/2023.
//

import SwiftUI

@main
struct YourApp: App {
    @StateObject private var swifties = Swifties() // Créez une instance de Swifties

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(swifties) // Injectez Swifties dans l'environnement
        }
    }
}
