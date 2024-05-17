//
//  PlansListItemViewModel.swift
//  Plans
//
//  Created by Mehmet ALAN on 17.05.2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class PlansListItemViewModel: ObservableObject {
    
    init() {}
    
    func toggleIsDone(item: PlansListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
