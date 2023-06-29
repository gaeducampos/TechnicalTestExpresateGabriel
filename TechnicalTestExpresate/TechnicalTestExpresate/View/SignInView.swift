//
//  SignInView.swift
//  TechnicalTestExpresate
//
//  Created by Gabriel Campos on 29/6/23.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var viewModel: UserViewModel
    var body: some View {
        VStack(spacing: 20) {
            
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)
            
            
            Button {
                viewModel.userSingIn()
            } label: {
                Text("Sign In")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(viewModel.isButtonDisable ? Color.red : Color.green,
                                    lineWidth: 2)
                    }
            }
            .disabled(viewModel.isButtonDisable == true)

            
        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: UserViewModel(service: .init()))
    }
}
