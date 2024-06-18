//
//  ScheduleViewModel.swift
//  EveryDay
//
//  Created by Alexander Suprun on 17.06.2024.
//
import SwiftUI
import RealmSwift

class ScheduleViewModel: ObservableObject {
    @Published var scheduleLists: Results<ScheduleList>
    private var notificationToken: NotificationToken?

    init() {        
        let realm = try! Realm()
        scheduleLists = realm.objects(ScheduleList.self).sorted(byKeyPath: "timestart", ascending: true)
        notificationToken = scheduleLists.observe { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
    
    deinit {
        notificationToken?.invalidate()
    }
    
    func deleteSchedule(_ schedule: ScheduleList) {
        let realm = try! Realm()
        try! realm.write {
            if !schedule.isInvalidated {
                realm.delete(schedule)
            }
        }
        objectWillChange.send()
    }

    func formatTime(_ time: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: time)
    }
    
    func capitalizeFirstLetter(_ string: String) -> String {
        string.prefix(1).capitalized + string.dropFirst()
    }
    
    var currentDay: String {
        let weekdayIndex = Calendar.current.component(.weekday, from: Date()) - 2
        return Days.allCases[weekdayIndex].rawValue
    }
    
    var currentParityWeek: String {
        let weekOfYear = Calendar.current.component(.weekOfYear, from: Date())
        return weekOfYear % 2 == 0 ? ParityWeek.honest.rawValue : ParityWeek.odd.rawValue
    }
}
