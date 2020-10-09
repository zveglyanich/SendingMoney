//
//  Operation+CoreDataProperties.swift
//  SendingMoney
//
//  Created by Павел Звеглянич on 08.10.2020.
//  Copyright © 2020 Pavel Zveglyanich. All rights reserved.
//
//

import Foundation
import CoreData


extension Operation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Operation> {
        return NSFetchRequest<Operation>(entityName: "Operation")
    }

    @NSManaged public var sendMoney: Float
    @NSManaged public var userOfSend: String?
    @NSManaged public var date: Date?
    @NSManaged public var user: User?

}
