//
//  FrameworkDetailView.swift
//  FrameWorks
//
//  Created by Alex on 2024-10-03.
//

import SwiftUI

struct FrameworkDetailView: View {
    var framework:Framework
  @Binding  var isShowingDetailView:Bool
    var body: some View {
        HStack{
            Spacer()
            Button{
                isShowingDetailView = false
            } label : {
                Image(systemName:"xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width:44, height:44) //makes it so you can miss x and still hit it
            }
            .padding(.trailing)
        }
        Spacer()
        FrameWorkTitle(name:framework.name, imageName: framework.imageName)
        Text(framework.description)
            .font(.body)
            .padding(.horizontal, 20.0)
        Spacer()
        Button{
            
        } label: {
            Text("Learn More")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.all, 20.0)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(100)
        }
    }
}
