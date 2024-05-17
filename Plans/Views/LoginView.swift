//
//  LoginView.swift
//  Plans
//
//  Created by Mehmet ALAN on 17.05.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(
                    title: "Giriş Yap",
                    subTitle: "Planlarını Yönet",
                    backgroundColor: .blue
                )
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(Color.red)
                    }
                    TextField("Eposta", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .padding(.top, 10)
                    SecureField("Parola", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.top, 10)
                    TLButton(
                        title: "Giriş Yap",
                        backgroundColor: .yellow,
                        action: {
                            viewModel.login()
                        }
                    )
                }
                .offset(y: -108)
                .padding(.bottom, 150)
                Spacer()
                HStack {
                    Text("Bir hesabın yok mu?")
                        .font(.system(size: 15))
                    NavigationLink("Buradan bir hesap oluştur", destination: RegisterView())
                        .font(.system(size: 15))
                        .foregroundColor(Color.blue)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
