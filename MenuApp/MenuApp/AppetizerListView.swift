//
//  AppetizerListView.swift
//  MenuApp
//
//  Created by Alex on 2024-10-11.
//

import SwiftUI

struct AppetizerListView: View {
    
    
    //view model instance
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.appetizers){ appetizer in
                    AppetizerView(appetizer: appetizer)
                }.navigationTitle("Appetizers")
            }  
            .onAppear{
                viewModel.getAppetizers()
            }
            if viewModel.isLoading{
                LoadingView()
            }
        }.alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton
            )
        })
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
