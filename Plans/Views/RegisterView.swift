//
//  RegisterView.swift
//  Plans
//
//  Created by Mehmet ALAN on 17.05.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    var body: some View {
        VStack {
            HeaderView(
                title: "Kayıt Ol",
                subTitle: "Planlarını Ayarla",
                backgroundColor: .yellow
            )
            .offset(y: -38)
            Form {
                TextField("İsim", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    .padding(.top, 10)
                TextField("Eposta", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .padding(.top, 10)
                SecureField("Parola", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.top, 10)
                TLButton(
                    title: "Kayıt Ol",
                    backgroundColor: .green,
                    action: {
                        viewModel.register()
                    }
                )
            }
            .offset(y: -146)
        }
        .padding(.bottom, 70)
    }
}

#Preview {
    RegisterView()
}
