//
//  ListView.swift
//  RealmTodo
//
//  Created by Masato Ishikawa on 2021/12/22.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0...10, id: \.self) { _ in
                    HStack {
                        Image(systemName: "circlebadge.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.blue)
                        VStack {
                            Text("タイトル")
                                .font(.title3)
                            Text("デスクリプション")
                                .font(.caption2)
                        }
                    }
                    .swipeActions(edge: .trailing) {
                        Button {
                            print("delete todo")
                        } label: {
                            Image(systemName: "trash")
                        }
                        .tint(.red)
                    }
                    .swipeActions(edge: .leading) {
                            Button {
                                print("show edit view")
                            } label: {
                                Image(systemName: "pencil.circle")
                            }
                            .tint(.green)
                    }
                }
            }
            .navigationTitle("Realm Todo")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}