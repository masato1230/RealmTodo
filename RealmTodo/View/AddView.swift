//
//  AddView.swift
//  RealmTodo
//
//  Created by Masato Ishikawa on 2021/12/24.
//

import SwiftUI

struct AddView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("タイトル")) {
                    TextField("", text: .constant("タイトル"))
                }
                Section(header: Text("デスクリプション")) {
                    TextField("", text: .constant("デスクリプション"))
                }
            }
            .navigationTitle("ToDoを追加")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {print("完了")}) {
                        Text("完了")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {print("キャンセル")}) {
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
