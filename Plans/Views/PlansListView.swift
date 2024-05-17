//
//  PlansListView.swift
//  Plans
//
//  Created by Mehmet ALAN on 17.05.2024.
//

import FirebaseFirestoreSwift
import SwiftUI

struct PlansListView: View {
    @StateObject var viewModel: PlansListViewModel
    @FirestoreQuery var items: [PlansListItem]
    private let userId: String
    init(userId: String) {
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: PlansListViewModel(userId: userId))
    }
    var body: some View {
        NavigationView {
            VStack {
                if (items.count == 0) {
                    Text("Heniz bir programınız bulunmamaktadır.")
                } else {
                    List(items) { item in
                        PlansListItemView(item: item)
                            .swipeActions {
                                Button("Sil") {
                                    viewModel.delete(id: item.id)
                                }
                                .tint(.red)
                            }
                    }
                }
            }
            .navigationTitle("Planlarım")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}
