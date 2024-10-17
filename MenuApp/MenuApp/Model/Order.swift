//
//  Order.swift
//  MenuApp
//
//  Created by Alex on 2024-10-16.
//

import SwiftUI


final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

