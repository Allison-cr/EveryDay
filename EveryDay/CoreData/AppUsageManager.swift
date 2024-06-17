//
//  AppUsageManager.swift
//  EveryDay
//
//  Created by Alexander Suprun on 14.06.2024.
//
import CoreData

class AppUsageManager {
    static let shared = AppUsageManager()
    
    private let context: NSManagedObjectContext

    private init() {
        self.context = CoreDataManager.shared.persistentContainer.viewContext
    }

    func isFirstLaunch() -> Bool {
        let request: NSFetchRequest<AppUsage> = AppUsage.fetchRequest()
        do {
            let results = try context.fetch(request)
            if let usage = results.first {
                return usage.isFirstLaunch
            } else {
                let newUsage = AppUsage(context: context)
                newUsage.isFirstLaunch = true
                saveContext()
                return true
            }
        } catch {
            fatalError("Failed to fetch AppUsage: \(error)")
        }
    }

    func setFirstLaunchCompleted() {
        let request: NSFetchRequest<AppUsage> = AppUsage.fetchRequest()
        do {
            let results = try context.fetch(request)
            if let usage = results.first {
                usage.isFirstLaunch = false
            } else {
                let newUsage = AppUsage(context: context)
                newUsage.isFirstLaunch = false
            }
            saveContext()
        } catch {
            fatalError("Failed to fetch AppUsage: \(error)")
        }
    }

    private func saveContext() {
        do {
            try context.save()
        } catch {
            fatalError("Failed to save context: \(error)")
        }
    }
}
