//
//  FactoryDatabaseAccess.swift
//  SwiftCRUD
//
//  Created by Владислав on 27.06.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation

class FactoryDatabaseAccess{
    
    //MARK: - Properties
    
    enum DatabaseType{
        case SQLite
    }
    
    static var sharedFactory = FactoryDatabaseAccess()
    
    //MARK: - Functions
    
    func createDatabaseInstance(database: DatabaseType) -> IDatabaseRepository {
        
        switch database {
        case .SQLite:
            return SQLiteDatabaseRepository()
        }
    }
}
