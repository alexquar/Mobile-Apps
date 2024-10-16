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
    @State private var isShowingDetail:Bool = false
    @State var activeAppetizer:Appetizer? = nil
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.appetizers){ appetizer in
                    AppetizerView(appetizer: appetizer)
                        .onTapGesture {
                            isShowingDetail = true
                            activeAppetizer = appetizer
                        }
                }.navigationTitle("Appetizers")
            }  
            .onAppear{
                viewModel.getAppetizers()
            }
            .blur(radius: isShowingDetail ? 20:0)
            .disabled(isShowingDetail)
            if isShowingDetail{
                AppetizerDetailView(appetizer: activeAppetizer!, isShowingDetail: $isShowingDetail)
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
            //get image through our appetizer remote image and the url we get from the reqs
            AppetizerRemoteImage(url: appetizer.imageURL)
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
