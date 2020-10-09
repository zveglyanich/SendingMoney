//
//  UserModel.swift
//  SendingMoney
//
//  Created by Павел Звеглянич on 04.10.2020.
//  Copyright © 2020 Pavel Zveglyanich. All rights reserved.
//

import Foundation
import  SwiftKeychainWrapper

class UserModel: NSObject, NSCoding {
    
    let login: String
    let password: String
    let firstname: String
    let secondName: String
    let city: String
    
    init(login: String, password: String, firstname: String, secondName: String, city: String) {
        self.login = login
        self.password = password
        self.firstname = firstname
        self.secondName = secondName
        self.city = city
    }
    func encode(with coder: NSCoder) {
        coder.encode(login, forKey: "login")
        coder.encode(password, forKey: "password")
        coder.encode(firstname, forKey: "firstname")
        coder.encode(secondName, forKey: "secondName")
        coder.encode(city, forKey: "city")
    }
    
    required init?(coder: NSCoder) {
        login = coder.decodeObject(forKey: "login") as? String ?? ""
        password = coder.decodeObject(forKey: "password") as? String ?? ""
        firstname = coder.decodeObject(forKey: "firstname") as? String ?? ""
        secondName = coder.decodeObject(forKey: "secondName") as? String ?? ""
        city = coder.decodeObject(forKey: "city") as? String ?? ""
    }
}
