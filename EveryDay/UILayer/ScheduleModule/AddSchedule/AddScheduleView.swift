//
//  AddScheduleView.swift
//  EveryDay
//
//  Created by Alexander Suprun on 17.06.2024.
//
import SwiftUI
import RealmSwift
import CustomToggle

struct AddScheduleView: View {
    @StateObject private var viewModel = AddScheduleViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Enter title", text: $viewModel.title)
                    TextField("Enter location", text: $viewModel.location)
                    TextField("Enter teacher", text: $viewModel.teacher)
                    
                    DatePicker("Start", selection: $viewModel.timestart, displayedComponents: .hourAndMinute)
                    DatePicker("End", selection: $viewModel.timeend, displayedComponents: .hourAndMinute)
                    
                    Picker("Week", selection: $viewModel.week) {
                        ForEach(ParityWeek.allCases, id: \.self) { week in
                            Text(week.rawValue.capitalized).tag(week.rawValue)
                        }
                    }
                    Picker("Day", selection: $viewModel.day) {
                        ForEach(Days.allCases, id: \.self) { day in
                            Text(day.rawValue.capitalized).tag(day.rawValue)
                        }
                    }
                }
                
                Button {
                    viewModel.saveSchedule()
                    dismiss()
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
            }
            .navigationTitle("New task")
        }
    }
}

#Preview {
    AddScheduleView()
}
