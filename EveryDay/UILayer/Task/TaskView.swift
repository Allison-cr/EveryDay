//
//  TaskView.swift
//  EveryDay
//
//  Created by Alexander Suprun on 17.06.2024.
//
import SwiftUI
import RealmSwift

struct TaskView: View {
    
    @State private var isPresentend: Bool = false
    @ObservedResults(TaskList.self) var taskLists
    var body: some View {
        NavigationView {
            VStack {
                if taskLists.isEmpty {
                    Text("no data")
                }
                List {
                    ForEach(taskLists, id: \.id) { taskList in
                        VStack {
                            Text(taskList.title)
                            Text(taskList.details)
                                .opacity(0.4)
                            Text(formatTime(taskList.timestart))
                            Text(formatTime(taskList.timeend))
                            Text(taskList.trend)

                        }
                    }.onDelete(perform: $taskLists.remove)
                }
            }
            .sheet(isPresented: $isPresentend, content: {
                AddTaskListScreen()
            })
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing)
                {
                    Button {
                        isPresentend = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    TaskView()
}


extension TaskView {
    func formatTime(_ time: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: time)
    }
}
