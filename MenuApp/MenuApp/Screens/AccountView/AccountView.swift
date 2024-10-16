//
//  AccountView.swift
//  MenuApp
//
//  Created by Alex on 2024-10-11.
//

import SwiftUI

struct AccountView: View {

@StateObject var viewModel = AccountViewModel()
    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("Personal Info")){
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $viewModel.birthDate, displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("save")
                    }
                    
                }
                Section(header: Text("Requests")){
                    Toggle("Extra Napkin", isOn: $viewModel.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.frequentRefills)
                        
                }
            }.navigationTitle("Account View")
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        
    }
}

#Preview {
    AccountView()
}
