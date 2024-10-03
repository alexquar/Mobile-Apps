//
//  FrameworkGridViewModel.swift
//  FrameWorks
//
//  Created by Alex on 2024-10-03.
//

import SwiftUI

final class FrameworkGridViewModel:ObservableObject {
    var selectedFramework:Framework? {
        didSet{
            isShowingDetailView = true
        }
    }
   @Published var isShowingDetailView:Bool = false
}
