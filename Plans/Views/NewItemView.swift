//
//  NewItemView.swift
//  Plans
//
//  Created by Mehmet ALAN on 17.05.2024.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack {
            Text("Programını Oluştur")
                .font(.system(size: 30))
                .bold()
                .padding()
            Form {
                TextField("Plan Adı", text: $viewModel.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                DatePicker("Bitiş Tarihi", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                TLButton(
                    title: "Kaydet",
                    backgroundColor: .green,
                    action: {
                        if viewModel.canSave {
                            viewModel.save()
                            newItemPresented = false
                        } else {
                            viewModel.showAlert = true
                        }
                    }
                )
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Hata"), message: Text("Lütfen planınıza bir isim veriniz ve tarihini belirleyiniz"))
                }
            }
        }
    }
}

#Preview {
    NewItemView(
        newItemPresented: Binding(
            get: {
                return true
            },
            set: {
                _ in
            }
        )
    )
}
