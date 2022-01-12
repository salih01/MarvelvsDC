//
//  MarvelVsDCApp.swift
//  MarvelVsDC
//
//  Created by Salih Çakmak on 12.01.2022.
//

import SwiftUI

@main
struct MarvelVsDCApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
