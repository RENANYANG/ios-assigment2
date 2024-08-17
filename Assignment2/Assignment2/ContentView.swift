//
//  ContentView.swift
//  Assignment2
//
//  Created by RENANYANG on 2024-08-17.
//

import SwiftUI

@main
struct Assignment2App: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                EmployeeListView()
                    .tabItem {
                        Label("Employees", systemImage: "person.3")
                    }
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}
