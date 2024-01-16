//
//  HomeView.swift
//  Alvara
//
//  Created by Alex Maina on 16/01/2024.
//

import SwiftUI


class HomeObservableObject: ObservableObject {
    @Published var dataArray: [String] = [];
    
    init() {
        // Func that will be initialized
        getData();
    }
    
    func getData() {
        dataArray.append(contentsOf: ["Alex Maina", "Daniel Gakeri", "Dennis Gachie"]);
    }
    
    // Create a function to delete data
    func deleteData(element: String) {
        dataArray.shuffle();
        
        print(dataArray);
    }
}

struct HomeView: View {
    @EnvironmentObject var viewModel: HomeObservableObject
    
    @State private var searchText: String = "";
    @State private var showSheet: Bool = false;
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) {item in
                    NavigationLink(destination: DestinationPage()) {
                        HStack(spacing: 10) {
                            Circle()
                                .fill(.gray)
                                .frame(width: 50, height: 50)
                            
                            VStack(alignment: .leading) {
                                Text(item)
                                    .font(.body)
                                
                                Text("Zae!. Sai ni late huwezi shuka kesho?")
                                    .font(.footnote)
                            }
                        }//: HSTACK
                    }//: NAVIGATIONLINK
                }
            }
            .actionSheet(isPresented: $showSheet, content: {
                ActionSheet(title: Text("This is an action sheet"), buttons: [
                    .default(Text("Delete")) { },
                    .default(Text("Print")) { },
                    .cancel()
                ])
            })
            .searchable(text: $searchText)
            .navigationBarTitle("Chats", displayMode: .large)
            .navigationBarItems(leading: Button(action: {}, label: {
                Menu {
                    Button("Order Now", action: {})
                    Button("Adjust Order", action: {})
                } label: {
                    Label("", systemImage: "ellipsis.circle")
                }
            }), trailing: HStack(spacing: 20) {
                Button {
                    
                } label: {
                    Image(systemName: "bolt.circle")
                        .font(.system(size: 18, weight: .none, design: .default))
                }// BUTTON
                
                Button {
                    self.showSheet.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 18, weight: .none, design: .default))
                }// BUTTON
            })
        }
        .environmentObject(viewModel)
    }
}

struct DestinationPage: View {
    // Initialize the Enivironmental Object
    @EnvironmentObject var viewModel: HomeObservableObject
    
    var body: some View {
        VStack {
            
            
            List(viewModel.dataArray, id: \.self) {item in
                Text(item);
                
                Text(viewModel.dataArray[0])
                    .onTapGesture {
                        viewModel.deleteData(element: viewModel.dataArray[1])
                    }
            }
        }
    }
}
