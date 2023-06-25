//
//  LoginView.swift
//  SwiftUIToDoList
//
//  Created by Алексей Поддубный on 18.05.2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "To Do List",
                           subTitle: "Get things done",
                           angle: 15,
                           backgroundColor: .pink)
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                }
                //Login Form
                Form {
                    TextField("Email address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Pasword", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log in",
                             background: .blue) {
                        viewModel.login()
                    }
                    .padding()
                }
                
                //Create account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an account",               destination:  RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
