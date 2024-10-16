//
//  AccountViewModel.swift
//  MenuApp
//
//  Created by Alex on 2024-10-15.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject{
    @Published var firstName:String = ""
    @Published var lastName:String = ""
    @Published var email:String = ""
    @Published var birthDate: Date = Date()
    @Published var extraNapkins:Bool = false
    @Published var frequentRefills:Bool = false
    @Published var alertItem:AlertItem?
    //computed prop for valid form
     var isValidForm : Bool {
        //if any test vals are empty it is not valid form
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else{
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
      
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        print("changes made")
    }
}
