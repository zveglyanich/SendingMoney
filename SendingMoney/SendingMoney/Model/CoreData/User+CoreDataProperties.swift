//
//  User+CoreDataProperties.swift
//  SendingMoney
//
//  Created by Павел Звеглянич on 08.10.2020.
//  Copyright © 2020 Pavel Zveglyanich. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var login: String?
    @NSManaged public var operations: NSSet?

}

// MARK: Generated accessors for operations
extension User {

    @objc(addOperationsObject:)
    @NSManaged public func addToOperations(_ value: Operation)

    @objc(removeOperationsObject:)
    @NSManaged public func removeFromOperations(_ value: Operation)

    @objc(addOperations:)
    @NSManaged public func addToOperations(_ values: NSSet)

    @objc(removeOperations:)
    @NSManaged public func removeFromOperations(_ values: NSSet)

}
