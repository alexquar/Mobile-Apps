//
//  ContentView.swift
//  MenuApp
//
//  Created by Alex on 2024-10-11.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
        }
        .accentColor(.brandPrimary)
        
    }
}

#Preview {
    AppetizerTabView()
}
