//
//  UserData.swift
//  Diaporama
//
//  Created by Admin on 23/05/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class UserData {
    
    private static var instance: UserData? = nil
    let KEY_DISPLAY_DURATION: String = "display_duration"
    
    private init() {
         UserDefaults.standard.register(defaults: [KEY_DISPLAY_DURATION : 7.0])
    }
    
    static func getInstance() -> UserData {
        if instance == nil {
            instance = UserData()
        }
        return instance!
    }
    
    var displayDuration: Double {
        get {
            return UserDefaults.standard.double(forKey: KEY_DISPLAY_DURATION)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: KEY_DISPLAY_DURATION)
        }
    }

    
}
