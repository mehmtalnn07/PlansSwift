//
//  PlansListItemView.swift
//  Plans
//
//  Created by Mehmet ALAN on 17.05.2024.
//

import SwiftUI

struct PlansListItemView: View {
    @StateObject var viewModel = PlansListItemViewModel()
    let item: PlansListItem
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(item.title)
                    .bold()
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            Spacer()
            VStack {
                Button {
                    viewModel.toggleIsDone(item: item)
                } label: {
                    Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(Color.blue)
                }
                if (item.isDone) {
                    Text("Tamamlandı")
                }
            }
        }
    }
}

#Preview {
    PlansListItemView(
        item: .init(
            id: "123",
            title: "İş yerini ara",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: true
        )
    )
}
