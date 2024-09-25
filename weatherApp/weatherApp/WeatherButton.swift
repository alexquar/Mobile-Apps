//
//  WeatherButton.swift
//  weatherApp
//
//  Created by Alex on 2024-09-25.
//

import SwiftUI
struct changeButton: View {
    var title:String
    var textColor:Color
    var bgColor:Color
    var body: some View {
            Text(title)
                .frame(width:280, height:50)
                .background(bgColor)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .medium, design: .default))
                .cornerRadius(20)
        }
}
