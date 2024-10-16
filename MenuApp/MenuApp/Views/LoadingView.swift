//
//  LoadingView.swift
//  MenuApp
//
//  Created by Alex on 2024-10-12.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack(){
            Color(.backGround).ignoresSafeArea(.all)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .accent))
                .scaleEffect(1.5, anchor: .center)
        }
            
    }
}

#Preview {
    LoadingView()
}
