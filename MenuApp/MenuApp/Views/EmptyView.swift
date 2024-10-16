//
//  EmptyView.swift
//  MenuApp
//
//  Created by Alex on 2024-10-16.
//

import SwiftUI

struct EmptyView: View {
    let imageName: String
    let message: String
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack(){
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150, alignment: .center)
                Text(message)
                    .font(.title3)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/ )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.brandPrimary)
                    .padding()
            }.offset(y:-50)
        }
    }
}

