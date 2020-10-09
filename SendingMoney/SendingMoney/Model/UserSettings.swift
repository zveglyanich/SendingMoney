//
//  UserSettings.swift
//  SendingMoney
//
//  Created by Павел Звеглянич on 04.10.2020.
//  Copyright © 2020 Pavel Zveglyanich. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

final class UserSettings {
    
    private enum SettingsKeys: String {
        case userCash
        case userInformation
    }
    
    static var userDefaultsModel: Float! {
        get {
            return UserDefaults.standard.float(forKey: SettingsKeys.userCash.rawValue)
        } set {
            if let cashToDownload = newValue {
                UserDefaults.standard.set(cashToDownload, forKey: SettingsKeys.userCash.rawValue)
            } else {
                UserDefaults.standard.removeObject(forKey: SettingsKeys.userCash.rawValue)
            }
        }
    }
    
    static var userKeyChainModel: UserModel! {
        get {
            guard let savedData = KeychainWrapper.standard.data(forKey: SettingsKeys.userInformation.rawValue), let decodedModel = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? UserModel else { return nil }
            return decodedModel
        }
        set {
            if let userModel = newValue {
                if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: userModel, requiringSecureCoding: false) {
                    KeychainWrapper.standard.set(savedData, forKey: SettingsKeys.userInformation.rawValue)
                    print (userModel)
                } else {
                    KeychainWrapper.standard.removeObject(forKey: SettingsKeys.userInformation.rawValue)
                }
            }
        }
    }
    
}
