//
//  ProfileView.swift
//  Plans
//
//  Created by Mehmet ALAN on 17.05.2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Profiliniz Yükleniyor...")
                }
            }
            .navigationTitle("Profilim")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.green)
            .frame(width: 125, height: 125)
            .padding()
        VStack (alignment: .leading) {
            HStack {
                Text("İsim: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Eposta: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Kayıt oldun: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        TLButton(
            title: "Çıkış Yap",
            backgroundColor: Color.red,
            action: {
                viewModel.logOut()
            }
        )
        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        .padding()
        Spacer()
    }
}

#Preview {
    ProfileView()
}
