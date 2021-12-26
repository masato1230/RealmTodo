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
            .navigationTitle(viewModel.updatingTodo == nil ? "ToDoを追加" : "ToDoを更新")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // 追加
                        if (viewModel.updatingTodo == nil) {
                            viewModel.addTodo()
                        } else {
                        // 更新
                            viewModel.updateTodo()
                        }
                        
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
