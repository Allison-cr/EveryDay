//
//  AddScheduleViewModel.swift
//  EveryDay
//
//  Created by Alexander Suprun on 17.06.2024.
//
import SwiftUI
import RealmSwift

class AddScheduleViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var teacher: String = ""
    @Published var timestart: Date = Date()
    @Published var timeend: Date = Date()
    @Published var location: String = ""
    @Published var week: String = ParityWeek.honest.rawValue
    @Published var day: String = Days.monday.rawValue
    
    func saveSchedule() {
        let scheduleList = ScheduleList()
        scheduleList.title = title
        scheduleList.teacher = teacher
        scheduleList.timestart = timestart
        scheduleList.timeend = timeend
        scheduleList.location = location
        scheduleList.week = week
        scheduleList.day = day
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(scheduleList)
        }
    }
}
