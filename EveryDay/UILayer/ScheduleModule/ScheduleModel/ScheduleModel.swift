//
//  ScheduleModel.swift
//  EveryDay
//
//  Created by Alexander Suprun on 17.06.2024.
//
import RealmSwift
import Foundation

enum Days: String, CaseIterable {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

enum ParityWeek: String, CaseIterable {
    case honest
    case odd
}

class ScheduleList: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var teacher = ""
    @Persisted var timestart = Date()
    @Persisted var timeend = Date()
    @Persisted var location = ""
    @Persisted var week = ParityWeek.honest.rawValue
    @Persisted var day = Days.monday.rawValue


    override class func primaryKey() -> String? {
        "id"
    }
}
