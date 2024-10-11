//
//  AppetizerListView.swift
//  MenuApp
//
//  Created by Alex on 2024-10-11.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView{
            VStack{
                List(
                    MockData.appetizers){ appetizer in
                        Text(appetizer.name)
                    }
            } .navigationTitle("Appetizer List View")

        }
    }
}

#Preview {
    AppetizerListView()
}
