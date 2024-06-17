//
//  AddTaskListScreen.swift
//  EveryDay
//
//  Created by Alexander Suprun on 17.06.2024.
//
import SwiftUI
import RealmSwift

struct AddTaskListScreen: View {
    @State private var title: String = ""
    @State private var details: String = ""
    @State private var locations: String = ""
    @State private var trend: String = ""
    @State var startPoint = Date()
    @State var endPoint = Date()

    @ObservedResults(TaskList.self) var taskLists
    
    @State var clicked = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {

            VStack(alignment: .leading) {
                
                HStack {
                    Text("New task")
                    Spacer()
                    showAlert()
                }
                .padding(.top, 48)
                .padding(.horizontal, 36)
                .font(.system(size: 24, weight: .semibold))

                Form {
                    TextField("Enter title", text: $title)
                    TextField("Enter locations", text: $locations)
                    TextField("Enter trend", text: $trend)
                    DatePicker("Start", selection: $startPoint)
                    DatePicker("End ", selection: $endPoint)
                    TextEditor(text: $details)
                        .frame(height: 100)
                }
            }
        }
    }
    fileprivate func showAlert() -> some View {
        Button(action: {
            self.clicked = true
        }, label: {
                Image(systemName: "plus")
        })
        .actionSheet(isPresented: $clicked) {
            ActionSheet(
                title: Text("Добавить?"),
                buttons: [
                    .destructive(Text("Добавить")) {
                        let taskList = TaskList()
                        taskList.title = title
                        taskList.details = details
                        taskList.timestart = startPoint
                        taskList.timeend = endPoint
                        taskList.location = locations
                        taskList.trend = trend

                        $taskLists.append(taskList)
                        dismiss()
                    },
                    .cancel()
                ]
            )
        }
    }

}

#Preview {
    AddTaskListScreen()
}

