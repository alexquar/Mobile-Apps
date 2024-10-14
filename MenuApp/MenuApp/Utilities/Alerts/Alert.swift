//
//  Alert.swift
//  MenuApp
//
//  Created by Alex on 2024-10-12.
//

import SwiftUI


struct AlertItem:Identifiable{
    let id = UUID()
    let title:Text
    let message:Text
    let dismissButton: Alert.Button
}


struct AlertContext {
static let invalidURL = AlertItem(
    title: Text("Invalid URL"),
    message: Text("Could not access informatiom from requested URL."),
    dismissButton: .default(Text("Close"))
)
    static let invalidResponse = AlertItem(
        title: Text("Server Error"),
        message: Text("Invalid response from server, please try again later."),
        dismissButton: .default(Text("Close"))
    )
    static let invalidData = AlertItem(
        title: Text("Server Error"),
        message: Text("Information recieved from server was invalid."),
        dismissButton: .default(Text("Close"))
    )
    static let unableToComplete = AlertItem(
        title: Text("Server Error"),
        message: Text("Unable to complete your request, try again later"),
        dismissButton: .default(Text("Close"))
    )}
