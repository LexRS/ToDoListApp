//
//  ToDoListViewViewModel.swift
//  SwiftUIToDoList
//
//  Created by Алексей Поддубный on 18.05.2023.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    ////Delete to do list item
    /// - Parameter id: item id to delete
    func delete(itemId: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(itemId)
            .delete()
    }
}
