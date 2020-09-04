//
//  iExpenseUIView.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 10/07/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name, type: String
    let amount: String
}

class Expenses: ObservableObject {
    @Published var items: [ExpenseItem] {
        didSet {
            guard let encoding = try? JSONEncoder().encode(items)
            else { return }
            UserDefaults.standard.set(encoding, forKey: "expense-items")
        }
    }

    init() {
        if let encoding = UserDefaults.standard.value(forKey: "expense-items") as? Data,
            let decoding = try? JSONDecoder().decode([ExpenseItem].self, from: encoding) {
            items = decoding
        } else {
            items = []
        }
    }
}

struct AddView: View {
    @Environment(\.presentationMode) private var presentationMode

    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    private let availableTypes = ["Business", "Personal"]
    var expenses = Expenses()

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Name", text: $name)
                    Picker("Type", selection: $type) {
                        ForEach(self.availableTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    TextField("Amount", text: $amount)
                        .keyboardType(.numberPad)
                }
                Button("Save") {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: self.amount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationBarTitle("Add expense")
        }
    }
}


struct iExpenseUIView: View {
    @ObservedObject private var expenses = Expenses()
    @State private var isShowingModal = false
    var body: some View {
        NavigationView {
            List {
                ForEach(self.expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)")
                    }
                }
                .onDelete { (indexSet) in
                    self.expenses.items.remove(atOffsets: indexSet)
                }
            }
            .sheet(isPresented: $isShowingModal) {
                AddView(expenses: self.expenses)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(trailing: Button(action: {
                self.isShowingModal.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
        }
    }
}

struct iExpenseUIView_Previews: PreviewProvider {
    static var previews: some View {
        iExpenseUIView()
    }
}
