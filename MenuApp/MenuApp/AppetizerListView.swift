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
                        AppetizerView(appetizer: appetizer)
                    }
            }
            .navigationTitle("Appetizers")
            
        }
    }
}

#Preview {
    AppetizerListView()
}

struct AppetizerView: View {
    var appetizer:Appetizer
    var body: some View {
        HStack{
            Image("asian-flank-steak").resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:120, height:90)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing:5){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price, specifier:"%.2f")")
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
            }.padding(.leading)
            
        }
    }
}
