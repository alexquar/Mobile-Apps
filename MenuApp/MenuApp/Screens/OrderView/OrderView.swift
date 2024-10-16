//
//  OrderView.swift
//  MenuApp
//
//  Created by Alex on 2024-10-11.
//

import SwiftUI

struct OrderView: View {
    @State private var  order = MockData.orderItems
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach( order){ appetizer in
                        HStack {
                                    AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 120, height: 90)
                                            .cornerRadius(8)
                                    } placeholder: {
                                        Image("food-placeholder")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 120, height: 90)
                                            .cornerRadius(8)
                                    }
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(appetizer.name)
                                            .font(.title2)
                                            .fontWeight(.medium)
                                        
                                        Text("$\(appetizer.price, specifier: "%.2f")")
                                            .foregroundColor(.secondary)
                                            .fontWeight(.semibold)
                                    }
                                    .padding(.leading)
                                }

                    }
                    .onDelete(perform: { indexSet in
                        order.remove(atOffsets: indexSet)
                    })

                }.listStyle(InsetGroupedListStyle())
                Button {
                    print("checkout")
                }  label : {
                    Text("place order")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: 260, height: 50)
                        .foregroundColor(.white)
                        .background(Color.brandPrimary)
                        .cornerRadius(10)
                }.padding(.vertical,25)
            }.navigationTitle("Orders")
        }
    }
}

#Preview {
    OrderView()
}
