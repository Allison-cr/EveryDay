//
//  Migrator.swift
//  EveryDay
//
//  Created by Alexander Suprun on 17.06.2024.
//
import Foundation
import RealmSwift

class Migrator {
    
    init() {
        updateSchema()
    }

    func updateSchema() {
        
        let config = Realm.Configuration(
            schemaVersion: 1, 
            migrationBlock: { migration, oldSchemaVersion in
                
                if oldSchemaVersion < 1 {
                    //
                }
            }
        )

        Realm.Configuration.defaultConfiguration = config
        
        do {
            let _ = try Realm()
        } catch {
            // Обработка ошибок при создании Realm
            print("Ошибка при инициализации Realm: \(error)")
        }
    }
}
