//
//  ContentView.swift
//  Alvara
//
//  Created by Alex Maina on 16/01/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: HomeObservableObject = HomeObservableObject();
    var body: some View {
        TabView {
            HomeView()
                .environmentObject(viewModel)
                .tabItem {
                    Image(systemName: "house")
                }
            
            SettingsView()
                .environmentObject(viewModel)
                .tabItem {
                    Image(systemName: "gear")
                }
        } //: TABVIEW
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
