//
//  ContentView.swift
//  FrameWorks
//
//  Created by Alex on 2024-10-01.
//

import SwiftUI

struct ContentView: View {
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @StateObject var viewModel = FrameworkGridViewModel()
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns:columns ){
                    ForEach(MockData.frameworks){ framework in
                        FrameWorkTitle(name:framework.name, imageName:framework.imageName)
                            .onTapGesture {
                                viewModel.selectedFramework=framework
                            }
                    }
                }
                .navigationTitle("Apple Frameworks")
                .sheet(isPresented: $viewModel.isShowingDetailView) {
                    FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.frameworks[0], isShowingDetailView: $viewModel.isShowingDetailView)
                }
            }
        }
    
    }
}

#Preview {
    ContentView()
}










struct FrameWorkTitle: View {
    let name:String
    let imageName:String
    var body: some View {
        VStack{
            Image(imageName)
                .resizable()
                .frame(width:90, height:90)
            Text(name)
                .font(.title)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }.padding()
    }
}
