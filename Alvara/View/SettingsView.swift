//
//  SettingsView.swift
//  Alvara
//
//  Created by Alex Maina on 16/01/2024.
//

import SwiftUI

struct SettingsView: View {
//    @StateObject private var viewModel: HomeObservableObject = HomeObservableObject();
    @EnvironmentObject private var viewModel: HomeObservableObject
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("About the Application")) {
                    LabeledContent("Application") {
                        Text(viewModel.dataArray[0])
                            .font(.system(size: 16, weight: .bold, design: .default))
                    }
                    
                    LabeledContent("Developer") {
                        Text("Alex Maina")
                            .font(.system(size: 16, weight: .bold, design: .default))
                    }
                    
                    LabeledContent("Version") {
                        Text("1.0.0")
                            .font(.system(size: 16, weight: .bold, design: .default))
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular).navigationBarTitle("Settings", displayMode: .inline)
           
        } //: NavigationView
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
