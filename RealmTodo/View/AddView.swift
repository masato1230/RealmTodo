//
//  AddView.swift
//  RealmTodo
//
//  Created by Masato Ishikawa on 2021/12/24.
//

import SwiftUI
import Foundation

struct AddView: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewModel = ListViewModel.shared
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("タイトル")) {
                    TextField("", text: $viewModel.title)
                }
                Section(header: Text("デスクリプション")) {
                    TextField("", text: $viewModel.desc)
                }
            }
            .navigationTitle("ToDoを追加")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        viewModel.addTodo()
                        viewModel.isShowAddView.toggle()
                    }) {
                        Text("完了")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }) {
                        Text("キャンセル")
                    }
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
