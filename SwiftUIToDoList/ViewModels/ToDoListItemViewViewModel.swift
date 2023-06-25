//
//  ToDoListItemsViewViewModel.swift
//  SwiftUIToDoList
//
//  Created by Алексей Поддубный on 18.05.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewViewModel: ObservableObject {
    
    init() {
        
    }
    
    func toggleIsDone(item: ToDoListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
