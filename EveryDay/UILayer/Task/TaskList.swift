//
//  TaskList.swift
//  EveryDay
//
//  Created by Alexander Suprun on 17.06.2024.
//
import RealmSwift
import Foundation

class TaskList: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var details = ""
    @Persisted var trend = ""
    @Persisted var timestart = Date()
    @Persisted var timeend = Date()
    @Persisted var location = ""


    override class func primaryKey() -> String? {
        "id"
    }
}
