//
//  RyugakuApp.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/6/21.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct RyugakuApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            let obj = observed()
            ContentView().environmentObject(obj).environmentObject(AuthViewModel.shared)
        }
    }
}
