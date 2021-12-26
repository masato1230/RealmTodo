//
//  ListViewModel.swift
//  RealmTodo
//
//  Created by Masato Ishikawa on 2021/12/25.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var isShowAddView = false
    @Published var updatingTodo: Todo? = nil
    @Published var todos: [Todo] = []
    @Published var title = ""
    @Published var desc = ""
    
    init () {
        fetchTodos()
    }
    
    func fetchTodos() {
        self.todos = Todo.fetchAllTodo()!
    }
    
    func addTodo() {
        Todo.addTodo(title: title, desc: desc)
        self.title = ""
        self.desc = ""
        fetchTodos()
    }
    
    func updateTodo() {
        Todo.updateTodo(todo: updatingTodo!, newTitle: self.title, newDesc: self.desc)
        // 初期化
        self.title = ""
        self.desc = ""
        updatingTodo = nil
        fetchTodos()
    }
    
    static let shared = ListViewModel()
}
