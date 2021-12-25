//
//  ListViewModel.swift
//  RealmTodo
//
//  Created by Masato Ishikawa on 2021/12/25.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var isShowAddView = false
    @Published var todos: [Todo] = []
    
    init () {
        fetchTodos()
    }
    
    func fetchTodos() {
        self.todos = Todo.fetchAllTodo()!
    }
    
    static let shared = ListViewModel()
}
