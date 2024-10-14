//
//  AppetizerListViewModel.swift
//  MenuApp
//
//  Created by Alex on 2024-10-11.
//

import Foundation
import SwiftUI

final class AppetizerListViewModel: ObservableObject{
    //var to fill with data
    @Published public var appetizers: [Appetizer] = []
    //published alert can be nil
    @Published public var alertItem: AlertItem?
    
    //published isLoading
    @Published public var isLoading:Bool = false
    //function to get appetizers
  public func getAppetizers(){
      //start loading
      self.isLoading = true
      //call netowkr function we made and take in result
      NetworkManager.shared.getAppetizer { result in
          //puts us on main thread???
          DispatchQueue.main.async{
              //we have recieved a res, don't care if success or not we now set isLoading false
              self.isLoading = false
              
              switch result{
                  //on a success we call the result appetizers
              case .success(let appetizers):
                  //assign it to the appetizers variable we made, have to use self cus it is a var on the struct
                  self.appetizers = appetizers
              case .failure(let error ):
                  switch error{
                  case .invalidData:
                      self.alertItem = AlertContext.invalidData
                  case .invalidURL:
                      self.alertItem = AlertContext.invalidURL
                  case .invalidResponse:
                      self.alertItem = AlertContext.invalidResponse
                  case .unableToComplete:
                      self.alertItem = AlertContext.unableToComplete

                  }
              }
          }
      }
    }
}
