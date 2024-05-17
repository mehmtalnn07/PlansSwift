//
//  TLButton.swift
//  Plans
//
//  Created by Mehmet ALAN on 17.05.2024.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                Text(title)
                    .foregroundStyle(Color.white)
                    .bold()
            }
        }
        .padding()
    }
}

#Preview {
    TLButton(
        title: "Value",
        backgroundColor: .yellow
    ) {
        
    }
}
