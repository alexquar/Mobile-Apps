//
//  AppetizerDetailView.swift
//  MenuApp
//
//  Created by Alex on 2024-10-13.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer:Appetizer
    
    var body: some View {
        VStack{
            Image("asian-flank-steak")
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width:300, height:225)
            
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing:40){
                    VStack(spacing:5){
                        Text("Calories:")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.calories)")
                            .foregroundColor(.accent )
                            .italic()
                            .fontWeight(.semibold)
                    }
                    VStack(spacing:5){
                        Text("Carbs:")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.carbs)")
                            .foregroundColor(.accent )
                            .italic()
                            .fontWeight(.semibold)
                    }
                    VStack(spacing:5){
                        Text("Protein:")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.protein)")
                            .foregroundColor(.accent )
                            .italic()
                            .fontWeight(.semibold)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                }
                }
            Spacer()
            Button{
                print("Clicked")
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .foregroundColor(.white)
            .padding()
            .background(Color(.brandPrimary))
            .cornerRadius(15)
            .padding(.bottom,30)
     
            
        }
        .frame(width: 300, height:525)
        //same background as light/dark mode over blurred bg
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color:.backGround , radius:40)
        .overlay(Button{
            print("close")
        }label:{
            ZStack{
                Circle()
                    .frame(width:30, height:30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width:44, height:44)
                    .foregroundColor(.brandPrimary)
            }
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer)
}
