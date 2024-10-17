//
//  AccountViewModel.swift
//  MenuApp
//
//  Created by Alex on 2024-10-15.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject{
    
    //key is user
    @AppStorage("user") private var userData: Data?
    
    public func saveChanges() {
        guard isValidForm else { return }
        
        do{
            //encode our user to JSON
            let data = try JSONEncoder().encode(user)
            //set it to our new info
            userData = data
            alertItem = AlertContext.userSaved
        } catch {
            alertItem = AlertContext.userNotSaved
        }
    } 
    
   public func retrieveUser(){
       //unwrap nil and return if there is no user cus its nil anyways
       guard let userData = userData else { return }
       
       do{
           user = try JSONDecoder().decode(User.self, from: userData)
       } catch {
           alertItem = AlertContext.userNotSaved
       }
    }
    
    @Published var user:User = User()
    @Published var alertItem:AlertItem?
    //computed prop for valid form
     var isValidForm : Bool {
        //if any test vals are empty it is not valid form
         guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else{
            alertItem = AlertContext.invalidForm
            return false
        }
        
         guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
      
        
        return true
    }
}
